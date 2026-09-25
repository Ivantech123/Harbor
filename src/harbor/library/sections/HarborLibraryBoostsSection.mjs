/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import { html, repeat } from "chrome://global/content/vendor/lit.all.mjs";
import { HarborLibrarySearchSection } from "moz-src:///zen/library/sections/HarborLibrarySearchSection.mjs";

let lazy = {};

ChromeUtils.defineESModuleGetters(lazy, {
  gHarborBoostsManager: "resource:///modules/harbor/boosts/HarborBoostsManager.sys.mjs",
});

const BOOST_TOPICS = ["harbor-boosts-update", "harbor-boosts-active-change"];

const boostKey = boost => `${boost.domain}/${boost.id}`;

export class HarborLibraryBoostsSection extends HarborLibrarySearchSection {
  static id = "boosts";
  static label = "library-boosts-section-title";

  static render(library) {
    return html`
      <harbor-library-boosts-section
        class="harbor-library-section"
        data-section="boosts"
        .library=${library}
      ></harbor-library-boosts-section>
    `;
  }

  #observer = { observe: () => this.requestUpdate() };
  #glanceBrowser = null;
  #editor = null;
  #menu = null;
  #menuBoost = null;
  #menuRow = null;

  connectedCallback() {
    super.connectedCallback();
    for (const topic of BOOST_TOPICS) {
      Services.obs.addObserver(this.#observer, topic);
    }
    this.#menu = this.#buildMenu();
  }

  disconnectedCallback() {
    super.disconnectedCallback();
    for (const topic of BOOST_TOPICS) {
      Services.obs.removeObserver(this.#observer, topic);
    }
    this.#menu?.hidePopup();
    this.#menu?.remove();
    this.#menu = null;
    this.#glanceBrowser = null;
  }

  get searchPlaceholderL10nId() {
    return "library-boosts-search-placeholder";
  }

  onSearchChanged() {
    this.requestUpdate();
  }

  #boosts() {
    const boosts = [];
    const query = this.searchQuery.toLowerCase();
    for (const [domain, entry] of lazy.gHarborBoostsManager.registeredDomains) {
      for (const [id, boostEntry] of entry.boostEntries) {
        const { boostData } = boostEntry;
        if (!boostData.changeWasMade) {
          continue;
        }
        if (
          query &&
          !boostData.boostName.toLowerCase().includes(query) &&
          !domain.toLowerCase().includes(query)
        ) {
          continue;
        }
        boosts.push({
          id,
          domain,
          name: boostData.boostName,
          enabled: entry.activeBoostId === id,
        });
      }
    }
    return boosts.sort(
      (a, b) => a.name.localeCompare(b.name) || a.domain.localeCompare(b.domain)
    );
  }

  // Actions

  #toggle(boost) {
    lazy.gHarborBoostsManager.toggleBoostActiveForDomain(boost.domain, boost.id);
  }

  #onRowClick(boost, row) {
    if (boost.enabled) {
      this.#edit(boost, row);
    } else {
      this.#toggle(boost);
    }
  }

  async #edit(boost, row) {
    if (this.#glanceBrowser) {
      return;
    }
    const url = `https://${boost.domain}/`;
    const uri = Services.io.newURI(url);
    if (!lazy.gHarborBoostsManager.canBoostSite(uri)) {
      return;
    }
    const rowRect = row.getBoundingClientRect();
    const glance = await gHarborGlanceManager.openDetachedGlance({
      url,
      clientX: rowRect.left + rowRect.width / 2,
      clientY: rowRect.top + rowRect.height / 2,
      userContextId: gHarborWorkspaces.getActiveWorkspace()?.containerTabId,
      triggeringPrincipal: Services.scriptSecurityManager.getSystemPrincipal(),
    });
    if (!glance) {
      return;
    }
    const { browser } = glance;
    this.#glanceBrowser = browser;
    glance.closed.then(() => {
      this.#glanceBrowser = null;
      this.#editor?.close();
      this.#editor = null;
    });
    await this.#whenNavigated(browser);
    if (this.#glanceBrowser !== browser) {
      return;
    }
    const stored = lazy.gHarborBoostsManager.loadBoostFromStore(
      boost.domain,
      boost.id
    );
    this.#editor = lazy.gHarborBoostsManager.openBoostWindow(window, stored, uri, {
      browser,
    });
  }

  #whenNavigated(browser) {
    if (browser.currentURI?.spec !== "about:blank") {
      return Promise.resolve();
    }
    return new Promise(resolve => {
      const listener = {
        QueryInterface: ChromeUtils.generateQI([
          "nsIWebProgressListener",
          "nsISupportsWeakReference",
        ]),
        onLocationChange(webProgress) {
          if (webProgress.isTopLevel) {
            browser.removeProgressListener(listener);
            resolve();
          }
        },
      };
      browser.addProgressListener(listener, Ci.nsIWebProgress.NOTIFY_LOCATION);
    });
  }

  async #export(boost) {
    const { boostEntry } = lazy.gHarborBoostsManager.loadBoostFromStore(
      boost.domain,
      boost.id
    );
    await lazy.gHarborBoostsManager.exportBoost(window, boostEntry.boostData);
  }

  #delete(boost) {
    lazy.gHarborBoostsManager.deleteBoost({ domain: boost.domain, id: boost.id });
  }

  // Context menu

  #buildMenu() {
    const menu = window.MozXULElement.parseXULToFragment(`
      <menupopup class="harbor-library-boosts-menu">
        <menuitem data-action="edit" data-l10n-id="library-boosts-menu-edit"/>
        <menuitem data-action="export" data-l10n-id="harbor-boost-save"/>
        <menuseparator/>
        <menuitem data-action="delete" data-l10n-id="harbor-boost-edit-delete"/>
      </menupopup>
    `).firstElementChild;
    menu.addEventListener("command", event => {
      const boost = this.#menuBoost;
      const row = this.#menuRow;
      if (!boost) {
        return;
      }
      switch (event.target.dataset.action) {
        case "edit":
          this.#edit(boost, row);
          break;
        case "export":
          this.#export(boost);
          break;
        case "delete":
          this.#delete(boost);
          break;
      }
    });
    menu.addEventListener("popuphidden", () => {
      this.#menuRow?.removeAttribute("menu-open");
      this.#menuRow = null;
      this.#menuBoost = null;
    });
    document.getElementById("mainPopupSet").appendChild(menu);
    return menu;
  }

  #openMenu(boost, row, event) {
    this.#menuRow?.removeAttribute("menu-open");
    this.#menuBoost = boost;
    this.#menuRow = row;
    row.setAttribute("menu-open", "true");
    this.#menu.openPopupAtScreen(event.screenX, event.screenY, true, event);
  }

  // Rendering

  #renderBoost(boost) {
    return html`
      <div
        class="harbor-library-row harbor-library-boost-row"
        ?disabled=${!boost.enabled}
        @click=${event => this.#onRowClick(boost, event.currentTarget)}
        @contextmenu=${event => {
          event.preventDefault();
          this.#openMenu(boost, event.currentTarget, event);
        }}
      >
        <div class="harbor-library-boost-icon harbor-squircle-before">
          <img src="page-icon:https://${boost.domain}/" alt="" />
        </div>
        <div class="harbor-library-row-text">
          <span class="harbor-library-row-title">${boost.name}</span>
          <span class="harbor-library-row-subtitle">${boost.domain}</span>
        </div>
        <div class="harbor-library-row-actions">
          <moz-toggle
            ?pressed=${boost.enabled}
            data-l10n-id="library-boosts-toggle"
            @click=${event => event.stopPropagation()}
            @toggle=${() => this.#toggle(boost)}
          ></moz-toggle>
        </div>
      </div>
    `;
  }

  renderItems() {
    const boosts = this.#boosts();
    if (!boosts.length) {
      return html`
        <div
          class="harbor-library-empty"
          data-l10n-id="library-boosts-empty"
        ></div>
      `;
    }
    return html`
      <div class="harbor-library-group">
        ${repeat(boosts, boostKey, boost => this.#renderBoost(boost))}
      </div>
    `;
  }
}

customElements.define("harbor-library-boosts-section", HarborLibraryBoostsSection);
