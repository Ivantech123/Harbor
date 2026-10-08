// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

{
  let lazy = {};

  ChromeUtils.defineESModuleGetters(lazy, {
    AddonManager: "resource://gre/modules/AddonManager.sys.mjs",
    CustomizableUI:
      "moz-src:///browser/components/customizableui/CustomizableUI.sys.mjs",
    AddonRepository: "resource://gre/modules/addons/AddonRepository.sys.mjs",
    SearchService: "moz-src:///toolkit/components/search/SearchService.sys.mjs",
  });

  const kHarborElementsToIgnore = [
    "harbor-browser-background",
    "harbor-toast-container",
  ];

  const kEssentialApps = [
    { url: "https://ya.ru", icon: "yandex", color: "#fc3f1d" },
    { url: "https://mail.yandex.ru", icon: "yandex-mail", color: "#fc3f1d" },
    { url: "https://web.telegram.org", icon: "telegram", color: "#2aabee" },
    { url: "https://vk.com", icon: "vk", color: "#0077ff" },
    { url: "https://gosuslugi.ru", icon: "gosuslugi", color: "#0d4cd3" },
    { url: "https://dzen.ru", icon: "dzen", color: "#202022" },
    { url: "https://music.yandex.ru", icon: "yandex-music", color: "#ffcc00" },
    { url: "https://www.youtube.com", icon: "youtube", color: "#ff0033" },
    { url: "https://github.com", icon: "github", color: "#57606a" },
  ];

  const kAdBlockerId = "uBlock0@raymondhill.net";

  const gChoices = {
    setDefaultBrowser: false,
    essentials: new Set(),
    blockAds: true,
  };

  let _adBlocker;

  async function fetchAdBlocker() {
    if (_adBlocker !== undefined) {
      return _adBlocker;
    }
    try {
      const [found, installed] = await Promise.all([
        lazy.AddonRepository.getAddonsByIDs([kAdBlockerId]),
        lazy.AddonManager.getAddonsByIDs([kAdBlockerId]),
      ]);
      _adBlocker = installed[0] || !found[0]?.sourceURI ? null : found[0];
    } catch (ex) {
      console.error(ex);
      _adBlocker = null;
    }
    return _adBlocker;
  }

  function clearBrowserElements() {
    for (const element of document.getElementById("browser").children) {
      if (kHarborElementsToIgnore.includes(element.id)) {
        continue;
      }
      element.style.display = "none";
    }
  }

  function getMotion() {
    return gHarborUIManager.motion;
  }

  function animate(...args) {
    return getMotion().animate(...args);
  }

  function parseXUL(xul) {
    return window.MozXULElement.parseXULToFragment(xul);
  }

  function initializeHarborWelcome() {
    document.documentElement.setAttribute("harbor-welcome-stage", "true");
    const XUL = `
      <html:video id="harbor-welcome-video" autoplay="" loop="" muted=""
                    disablepictureinpicture="" tabindex="-1"
                    src="chrome://browser/content/harbor-videos/welcome-background.mp4"></html:video>
      <html:div id="harbor-welcome">
        <html:div id="harbor-welcome-start">
          <html:h1 id="harbor-welcome-title"></html:h1>
          <button class="footer-button primary" id="harbor-welcome-start-button" data-l10n-id="harbor-welcome-start">
          </button>
        </html:div>
        <html:div id="harbor-welcome-pages">
          <html:div id="harbor-welcome-page-sidebar">
            <html:button id="harbor-welcome-back" data-l10n-id="harbor-welcome-back"></html:button>
            <html:div id="harbor-welcome-page-sidebar-content"></html:div>
            <html:div id="harbor-welcome-page-sidebar-buttons"></html:div>
          </html:div>
          <html:div id="harbor-welcome-page-content"></html:div>
        </html:div>
      </html:div>
    `;
    document.getElementById("browser").appendChild(parseXUL(XUL));
    const video = document.getElementById("harbor-welcome-video");
    video.play().catch(() => {});
    window.MozXULElement.insertFTLIfNeeded("browser/harbor-welcome.ftl");
  }

  var _iconToData = {};

  async function getIconData(iconURL) {
    if (_iconToData[iconURL]) {
      return _iconToData[iconURL];
    }
    const response = await fetch(iconURL);
    if (!response.ok) {
      console.error(`Failed to fetch icon: ${iconURL}`);
      return null;
    }
    const blob = await response.blob();
    const reader = new FileReader();
    const data = await new Promise(resolve => {
      reader.onloadend = () => {
        const base64Data = reader.result.split(",")[1];
        _iconToData[iconURL] = `data:${blob.type};base64,${base64Data}`;
        resolve(_iconToData[iconURL]);
      };
      reader.readAsDataURL(blob);
    });
    return data;
  }

  function createOption({ id, group, checked, l10n, text, extra }) {
    const label = document.createElement("label");
    label.className = "harbor-welcome-option";
    label.setAttribute("for", id);
    const input = document.createElement("input");
    input.type = "radio";
    input.id = id;
    input.name = group;
    input.checked = !!checked;
    label.appendChild(input);
    const radio = document.createElement("span");
    radio.className = "harbor-welcome-option-radio no-squircles";
    label.appendChild(radio);
    if (extra) {
      label.appendChild(extra);
    }
    const labelText = document.createElement("span");
    labelText.className = "harbor-welcome-option-label";
    if (l10n) {
      document.l10n.setAttributes(labelText, l10n);
    } else {
      labelText.textContent = text;
    }
    label.appendChild(labelText);
    return label;
  }

  const _startedInstalls = new Set();

  function unpinInstalledAddon(addon) {
    const widgetId =
      addon.id.toLowerCase().replace(/[^a-z0-9_-]/g, "_") + "-browser-action";
    try {
      if (lazy.CustomizableUI.getPlacementOfWidget(widgetId)) {
        lazy.CustomizableUI.addWidgetToArea(
          widgetId,
          lazy.CustomizableUI.AREA_ADDONS
        );
      }
    } catch (ex) {
      console.error(ex);
    }
  }

  function installAddons(addons) {
    for (const addon of addons) {
      if (_startedInstalls.has(addon.id)) {
        continue;
      }
      _startedInstalls.add(addon.id);
      (async () => {
        try {
          const install = await lazy.AddonManager.getInstallForURL(
            addon.sourceURI.spec,
            { name: addon.name, icons: addon.icons }
          );
          await install.install();
          unpinInstalledAddon(addon);
        } catch (ex) {
          console.error(`Failed to install ${addon.id}`, ex);
        }
      })();
    }
  }

  function removeVideoBackground() {
    const video = document.getElementById("harbor-welcome-video");
    if (!video) {
      return;
    }
    animate(video, { opacity: 0 }, { duration: 0.6, ease: "easeOut" }).then(
      () => {
        video.pause();
        video.remove();
      }
    );
  }

  const kSpring = { type: "spring", bounce: 0.35, visualDuration: 0.35 };
  const kExit = { duration: 0.12, ease: "easeIn" };
  const kFade = { duration: 0.25, ease: "easeOut" };

  class nsHarborWelcomePages {
    #index = -1;
    #pages;
    #content = null;
    #renderToken = 0;
    #buttonsToken = 0;

    constructor(pages) {
      this.#pages = pages;
      this.init();
      this.next();
    }

    get textContainer() {
      return document.getElementById("harbor-welcome-page-sidebar-content");
    }

    get contentContainer() {
      return document.getElementById("harbor-welcome-page-content");
    }

    get buttonsContainer() {
      return document.getElementById("harbor-welcome-page-sidebar-buttons");
    }

    get backButton() {
      return document.getElementById("harbor-welcome-back");
    }

    get currentPage() {
      return this.#pages[this.#index];
    }

    get content() {
      return this.#content;
    }

    init() {
      document.getElementById("harbor-welcome-start").remove();
      const pages = document.getElementById("harbor-welcome-pages");
      pages.style.display = "flex";
      animate(pages, { opacity: [0, 1] }, { ...kFade, duration: 0.45 });
      this.backButton.addEventListener("click", () => this.back());
    }

    next() {
      this.currentPage?.commit?.(this.#content);
      this.#show(this.#index + 1, 1);
    }

    back() {
      if (this.#index <= 0) {
        return;
      }
      this.#show(this.#index - 1, -1);
    }

    #show(index, direction) {
      const previous = this.currentPage;
      while (this.#pages[index]?.skip?.()) {
        index += direction;
      }
      if (index < 0) {
        return;
      }
      this.#index = index;
      const page = this.currentPage;
      if (!page) {
        this.finish();
        return;
      }
      previous?.leave?.();
      this.#exit(this.textContainer, { x: [0, -80 * direction] });
      this.#exit(this.contentContainer, {});
      this.backButton.toggleAttribute("disabled", index === 0);
      this.updateButtons();
      this.#renderText(page, direction);
      this.#renderContent(page);
    }

    #exit(container, keyframes) {
      for (const element of container.children) {
        if (element.hasAttribute("exiting")) {
          continue;
        }
        element.setAttribute("exiting", "");
        animate(element, { opacity: [1, 0], ...keyframes }, kExit).then(() =>
          element.remove()
        );
      }
    }

    async #renderText(page, direction) {
      const token = ++this.#renderToken;
      const text = document.createElement("div");
      text.className = "harbor-welcome-text";
      const title = document.createElement("h1");
      document.l10n.setAttributes(title, page.title);
      text.appendChild(title);
      for (const id of page.descriptions ?? []) {
        const p = document.createElement("p");
        document.l10n.setAttributes(p, id);
        text.appendChild(p);
      }
      await document.l10n.translateFragment(text);
      if (token !== this.#renderToken) {
        return;
      }
      this.textContainer.appendChild(text);
      animate(
        [...text.children],
        { opacity: [0, 1], x: [120 * direction, 0] },
        {
          ...kSpring,
          bounce: 0.4,
          visualDuration: 0.3,
          delay: getMotion().stagger(0.03),
        }
      );
    }

    #renderContent(page) {
      const content = document.createElement("div");
      content.className = "harbor-welcome-page";
      if (page.id) {
        content.setAttribute("page", page.id);
      }
      page.render(content, this);
      this.contentContainer.appendChild(content);
      this.#content = content;
      animate(content, { opacity: [0, 1] }, kFade);
    }

    async updateButtons() {
      const token = ++this.#buttonsToken;
      const fragment = document.createDocumentFragment();
      for (const button of this.currentPage.buttons) {
        const element = document.createElement("button");
        element.className = button.primary
          ? "harbor-big-accent-button primary"
          : "harbor-big-accent-button";
        document.l10n.setAttributes(element, button.l10n);
        element.addEventListener("click", () => {
          if (button.onclick?.(this) !== false) {
            this.next();
          }
        });
        fragment.appendChild(element);
      }
      await document.l10n.translateFragment(fragment);
      if (token === this.#buttonsToken) {
        this.buttonsContainer.replaceChildren(fragment);
      }
    }

    async finish() {
      ++this.#buttonsToken;
      this.buttonsContainer.replaceChildren();
      this.backButton.toggleAttribute("disabled", true);
      gHarborWorkspaces.reorganizeTabsAfterWelcome();
      const promises = [this.#applyChoices()];
      await animate("#harbor-welcome", { opacity: [1, 0] });
      this.contentContainer.remove();
      await Promise.all(promises);
      _iconToData = undefined; // Unload icon data
      document.getElementById("harbor-welcome").remove();
      document.documentElement.removeAttribute("harbor-welcome-stage");
      unlockWindowSize();
      for (const element of document.getElementById("browser").children) {
        if (kHarborElementsToIgnore.includes(element.id)) {
          continue;
        }
        element.style.opacity = 0;
        element.style.removeProperty("display");
      }
      gHarborUIManager.updateTabsToolbar();
      let elementsToIgnore = kHarborElementsToIgnore
        .map(id => `#${id}`)
        .join(", ");
      await animate(`#browser > *:not(${elementsToIgnore})`, {
        opacity: [0, 1],
      });
      // After onboarding, land on the built-in welcome page.
      gHarborUIManager.openAndChangeToTab(
        "chrome://browser/content/harbor-pages/welcome.html"
      );
      _adBlocker = undefined;
      _startedInstalls.clear();
    }

    async #applyChoices() {
      await this.#pinEssentials();
      let tabsToGroup = [];
      if (!gBrowser.selectedTab.hasAttribute("harbor-empty-tab")) {
        tabsToGroup.push(gBrowser.selectedTab);
      }
      gHarborFolders.createFolder(tabsToGroup, {
        renameFolder: false,
        label: "Основное",
      });
    }

    async #pinEssentials() {
      const apps = kEssentialApps.filter(app =>
        gChoices.essentials.has(app.url)
      );
      if (!apps.length) {
        return;
      }
      await PlacesUtils.history.insertMany(
        apps.map(app => ({
          url: app.url,
          visits: [{ transition: PlacesUtils.history.TRANSITIONS.TYPED }],
        }))
      );
      const { TabStateCache } = ChromeUtils.importESModule(
        "moz-src:///browser/components/sessionstore/TabStateCache.sys.mjs"
      );
      for (const app of apps) {
        const tab = window.gBrowser.addTrustedTab(app.url, {
          inBackground: true,
          createLazyBrowser: true,
        });
        const icon = await getIconData(
          `chrome://browser/content/harbor-images/favicons/${app.icon}.svg`
        );
        // Update the persistent tab state cache with |tabData| information.
        TabStateCache.update(tab.linkedBrowser.permanentKey, {
          history: { entries: [{ url: app.url }], index: 0 },
          image: icon,
        });
        gBrowser.setIcon(tab, icon);
        tab.removeAttribute("pending"); // Make it appear loaded
        gHarborPinnedTabManager.addToEssentials(tab);
      }
    }
  }

  class HarborSearchEngineStore {
    constructor() {
      this._engines = [];
    }

    async init() {
      // Yandex is added at startup, the list has to wait for it.
      await ChromeUtils.importESModule(
        "chrome://browser/content/harbor/HarborRuSearch.mjs"
      ).ensureYandexSearch();
      const visibleEngines = await lazy.SearchService.getVisibleEngines();
      this.initSpecificEngine(visibleEngines);
    }

    getEngines() {
      return this._engines.filter(
        engine =>
          !(
            engine.name.toLowerCase().includes("wikipedia") ||
            engine.name.toLowerCase().includes("ebay")
          )
      );
    }

    initSpecificEngine(engines) {
      for (const engine of engines) {
        try {
          this._engines.push(this._cloneEngine(engine));
        } catch (e) {
          // Ignore engines that throw an exception when cloning.
          console.error(e);
        }
      }
    }

    getEngineByName(aName) {
      return this._engines.find(engine => engine.name == aName);
    }

    _cloneEngine(aEngine) {
      const clonedObj = {};

      for (const i of ["name", "alias", "_iconURI", "hidden"]) {
        clonedObj[i] = aEngine[i];
      }

      clonedObj.originalEngine = aEngine;

      return clonedObj;
    }

    async getDefaultEngine() {
      let engineName = await lazy.SearchService.getDefault();
      return this.getEngineByName(engineName._name);
    }

    async setDefaultEngine(engine) {
      await lazy.SearchService.setDefault(
        engine.originalEngine,
        lazy.SearchService.CHANGE_REASON.USER
      );
    }
  }

  const kNextButton = { l10n: "harbor-generic-next", primary: true };

  async function setDefaultBrowser() {
    const shellSvc =
      AppConstants.HAVE_SHELL_SERVICE && window.getShellService();
    if (!shellSvc) {
      return;
    }
    try {
      await shellSvc.setDefaultBrowser(false);
    } catch (ex) {
      console.error(ex);
    }
  }

  function getWelcomePages() {
    return [
      {
        id: "import",
        title: "harbor-welcome-import-title",
        descriptions: ["harbor-welcome-import-description"],
        buttons: [kNextButton],
        render(content) {
          const yes = createOption({
            id: "harbor-welcome-import-yes",
            group: "harbor-welcome-import",
            l10n: "harbor-welcome-import-yes",
          });
          content.appendChild(yes);
          content.appendChild(
            createOption({
              id: "harbor-welcome-import-no",
              group: "harbor-welcome-import",
              l10n: "harbor-welcome-import-no",
              checked: true,
            })
          );
        },
        commit(content) {
          if (content.querySelector("#harbor-welcome-import-yes").checked) {
            MigrationUtils.showMigrationWizard(window, {
              isStartupMigration: true,
            });
          }
        },
      },
      {
        id: "colors",
        title: "harbor-welcome-workspace-colors-title",
        descriptions: ["harbor-welcome-workspace-colors-description"],
        buttons: [kNextButton],
        render(content) {
          removeVideoBackground();
          const anchor = document.createElement("div");
          anchor.id = "harbor-welcome-workspace-colors-anchor";
          content.appendChild(anchor);
          const panel = gHarborThemePicker.panel;
          panel.setAttribute("noautohide", "true");
          panel.setAttribute("consumeoutsideclicks", "false");
          panel.setAttribute("nonnative", "");
          panel.addEventListener(
            "popupshowing",
            () => {
              const panelRect = panel.getBoundingClientRect();
              // 20 is the shadow width * 2
              anchor.style.height =
                panelRect.height -
                (AppConstants.platform == "macosx" ? -90 : 20) +
                "px";
              anchor.style.width = panelRect.width - 20 + "px";
            },
            { once: true }
          );
          PanelMultiView.openPopup(panel, anchor, { position: "overlap" });
        },
        leave() {
          const panel = gHarborThemePicker.panel;
          panel.removeAttribute("noautohide");
          panel.removeAttribute("consumeoutsideclicks");
          panel.removeAttribute("nonnative");
          animate(panel, { opacity: [1, 0] }, kExit).then(() => {
            panel.hidePopup();
            panel.removeAttribute("style");
          });
        },
      },
      {
        id: "search",
        title: "harbor-welcome-default-search-title",
        descriptions: ["harbor-welcome-default-search-description"],
        buttons: [kNextButton],
        async render(content) {
          const engineStore = new HarborSearchEngineStore();
          await engineStore.init();
          const defaultEngine = await lazy.SearchService.getDefault();
          for (const engine of engineStore.getEngines()) {
            const iconWrapper = document.createElement("div");
            iconWrapper.className = "engine-icon-wrapper";
            const iconBackdrop = document.createElement("img");
            iconBackdrop.className = "engine-icon-backdrop";
            const icon = document.createElement("img");
            icon.className = "engine-icon";
            icon.width = icon.height = 40;
            iconWrapper.append(iconBackdrop, icon);
            engine.originalEngine.getIconURL(96).then(url => {
              icon.src = url;
              iconBackdrop.src = url;
            });
            const option = createOption({
              id: "harbor-welcome-engine-" + engine.name.replace(/\s+/g, "-"),
              group: "harbor-welcome-search-engine",
              text: engine.name,
              checked: engine.name === defaultEngine.name,
              extra: iconWrapper,
            });
            option
              .querySelector("input")
              .addEventListener("change", () =>
                engineStore.setDefaultEngine(engine)
              );
            content.appendChild(option);
          }
        },
      },
      {
        id: "block-ads",
        title: "harbor-welcome-block-ads-title",
        descriptions: ["harbor-welcome-block-ads-description"],
        buttons: [kNextButton],
        // Nothing to offer once we know the add-on can't be installed.
        skip() {
          return _adBlocker === null;
        },
        async render(content, pages) {
          content.appendChild(
            createOption({
              id: "harbor-welcome-block-ads-yes",
              group: "harbor-welcome-block-ads",
              l10n: "harbor-welcome-block-ads-yes",
              checked: gChoices.blockAds,
            })
          );
          content.appendChild(
            createOption({
              id: "harbor-welcome-block-ads-no",
              group: "harbor-welcome-block-ads",
              l10n: "harbor-welcome-block-ads-no",
              checked: !gChoices.blockAds,
            })
          );
          // The lookup is warmed at startup, so this usually settled long ago.
          if ((await fetchAdBlocker()) === null && content.isConnected) {
            pages.next();
          }
        },
        commit(content) {
          gChoices.blockAds = content.querySelector(
            "#harbor-welcome-block-ads-yes"
          ).checked;
          if (gChoices.blockAds && _adBlocker) {
            installAddons([_adBlocker]);
          }
        },
      },
      {
        id: "essentials",
        title: "harbor-welcome-essentials-title",
        descriptions: ["harbor-welcome-essentials-description"],
        buttons: [
          kNextButton,
          {
            l10n: "harbor-welcome-skip",
            onclick(pages) {
              for (const button of pages.content.querySelectorAll(
                ".harbor-welcome-essential[selected]"
              )) {
                button.removeAttribute("selected");
              }
            },
          },
        ],
        render(content) {
          content.appendChild(
            parseXUL(`
              <html:div class="harbor-welcome-mock-browser">
                <html:div class="harbor-welcome-mock-browser-sidebar">
                  <html:div class="harbor-welcome-mock-browser-dots">
                    <html:div class="no-squircles"></html:div>
                    <html:div class="no-squircles"></html:div>
                    <html:div class="no-squircles"></html:div>
                  </html:div>
                  <html:div id="harbor-welcome-essentials"></html:div>
                  <html:div class="harbor-welcome-mock-tab"></html:div>
                  <html:div class="harbor-welcome-mock-tab"></html:div>
                </html:div>
              </html:div>
            `)
          );
          const grid = content.querySelector("#harbor-welcome-essentials");
          for (const app of kEssentialApps) {
            const button = document.createElement("button");
            button.className = "harbor-welcome-essential";
            button.dataset.url = app.url;
            button.style.setProperty(
              "--harbor-welcome-app-icon",
              `url("chrome://browser/content/harbor-images/favicons/${app.icon}.svg")`
            );
            button.style.setProperty("--harbor-welcome-app-color", app.color);
            button.toggleAttribute(
              "selected",
              gChoices.essentials.has(app.url)
            );
            button.addEventListener("click", () => {
              button.toggleAttribute("selected");
            });
            grid.appendChild(button);
          }
        },
        commit(content) {
          gChoices.essentials = new Set(
            [
              ...content.querySelectorAll(".harbor-welcome-essential[selected]"),
            ].map(button => button.dataset.url)
          );
        },
      },
      {
        id: "default-browser",
        title: "harbor-welcome-default-browser-title",
        descriptions: ["harbor-welcome-default-browser-description"],
        buttons: [kNextButton],
        render(content) {
          content.appendChild(
            createOption({
              id: "harbor-welcome-set-default-browser",
              group: "harbor-welcome-default-browser",
              l10n: "harbor-welcome-set-default-browser",
              checked: gChoices.setDefaultBrowser,
            })
          );
          content.appendChild(
            createOption({
              id: "harbor-welcome-dont-set-default-browser",
              group: "harbor-welcome-default-browser",
              l10n: "harbor-welcome-dont-set-default-browser",
              checked: !gChoices.setDefaultBrowser,
            })
          );
        },
        commit(content) {
          gChoices.setDefaultBrowser = content.querySelector(
            "#harbor-welcome-set-default-browser"
          ).checked;
          if (gChoices.setDefaultBrowser) {
            setDefaultBrowser();
          }
        },
      },
      {
        id: "finish",
        title: "harbor-welcome-start-browsing-title",
        descriptions: ["harbor-welcome-start-browsing-description-1"],
        buttons: [{ l10n: "harbor-welcome-start-browsing", primary: true }],
        render(content) {
          const logo = document.createElement("img");
          logo.className = "harbor-welcome-finish-logo";
          logo.src = "chrome://branding/content/about-logo@2x.png";
          logo.alt = "";
          content.appendChild(logo);
        },
      },
    ];
  }

  async function animateInitialStage() {
    const [title1, title2] = await document.l10n.formatValues([
      { id: "harbor-welcome-title-line1" },
      { id: "harbor-welcome-title-line2" },
    ]);
    const titleElement = document.getElementById("harbor-welcome-title");
    for (const line of [title1, title2]) {
      const lineElement = document.createElement("span");
      for (const char of line) {
        if (char === " ") {
          lineElement.append(" ");
          continue;
        }
        const charElement = document.createElement("span");
        charElement.className = "harbor-welcome-char";
        charElement.textContent = char;
        lineElement.appendChild(charElement);
      }
      titleElement.appendChild(lineElement);
    }
    const chars = titleElement.querySelectorAll(".harbor-welcome-char");
    await animate(
      chars,
      { opacity: [0, 1], y: [50, 0] },
      {
        delay: getMotion().stagger(0.035, { startDelay: 0.8 }),
        type: "spring",
        bounce: 0.3,
        visualDuration: 0.45,
      }
    );
    const button = document.getElementById("harbor-welcome-start-button");
    button.addEventListener(
      "click",
      async () => {
        await animate(
          "#harbor-welcome-title .harbor-welcome-char, #harbor-welcome-start-button",
          { opacity: [1, 0], y: [0, -14] },
          {
            duration: 0.3,
            ease: "easeIn",
            delay: getMotion().stagger(0.012),
          }
        );
        new nsHarborWelcomePages(getWelcomePages());
      },
      { once: true }
    );
    await animate(
      button,
      { opacity: [0, 1], y: [20, 0], filter: ["blur(2px)", "blur(0px)"] },
      {
        delay: 0.1,
        type: "spring",
        stiffness: 300,
        damping: 20,
        mass: 1.8,
      }
    );
  }

  const kSizeLockProperties = [
    "min-width",
    "max-width",
    "min-height",
    "max-height",
  ];

  function lockWindowSize(width, height) {
    const style = document.documentElement.style;
    style.setProperty("min-width", `${width}px`, "important");
    style.setProperty("max-width", `${width}px`, "important");
    style.setProperty("min-height", `${height}px`, "important");
    style.setProperty("max-height", `${height}px`, "important");
  }

  function unlockWindowSize() {
    const style = document.documentElement.style;
    for (const property of kSizeLockProperties) {
      style.removeProperty(property);
    }
  }

  function centerWindowOnScreen() {
    window.addEventListener(
      "MozAfterPaint",
      function () {
        const width = Math.min(1200, screen.availWidth);
        const height = Math.min(720, screen.availHeight);
        window.resizeTo(width, height);
        window.focus();
        const appWin = window.docShell.treeOwner
          .QueryInterface(Ci.nsIInterfaceRequestor)
          .getInterface(Ci.nsIAppWindow);
        appWin.rollupAllPopups();
        window.moveTo(
          screen.availLeft + (screen.availWidth - width) / 2,
          screen.availTop + (screen.availHeight - height) / 2
        );
        lockWindowSize(width, height);
      },
      { once: true }
    );
  }

  function startHarborWelcome() {
    fetchAdBlocker();
    clearBrowserElements();
    centerWindowOnScreen();
    initializeHarborWelcome();
    animateInitialStage();
  }

  startHarborWelcome();
}
