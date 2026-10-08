// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Firefox no longer ships Yandex, and its search configuration is replaced
// from the network, so an engine added to the bundled configuration would
// not last. Add it the way a user would: that one is kept in the profile.

const lazy = {};

ChromeUtils.defineESModuleGetters(lazy, {
  SearchService: "moz-src:///toolkit/components/search/SearchService.sys.mjs",
});

const DONE_PREF = "harbor.search.yandex.added";
const REGION_PREF = "browser.search.region";

export const YANDEX_ENGINE = Object.freeze({
  name: "Яндекс",
  alias: "@ya",
  url: "https://yandex.ru/search/?text={searchTerms}",
  suggestUrl: "https://suggest.yandex.ru/suggest-ff.cgi?part={searchTerms}&uil=ru",
  icon: "chrome://browser/content/harbor-images/favicons/yandex.svg",
});

let pending = null;

async function addYandex() {
  // Resolves once the search service is ready.
  await lazy.SearchService.getVisibleEngines();

  let engine = lazy.SearchService.getEngineByName(YANDEX_ENGINE.name);
  if (!engine) {
    engine = await lazy.SearchService.addUserEngine({
      name: YANDEX_ENGINE.name,
      alias: YANDEX_ENGINE.alias,
      url: YANDEX_ENGINE.url,
      suggestUrl: YANDEX_ENGINE.suggestUrl,
    });
    try {
      await engine.changeIcon(YANDEX_ENGINE.icon);
    } catch (e) {
      // The engine works without its icon.
      console.error("Harbor: could not set the Yandex icon", e);
    }
  }

  // Only the first time: after that the default is the user's business.
  if (Services.prefs.getStringPref(REGION_PREF, "").toUpperCase() === "RU") {
    await lazy.SearchService.setDefault(
      engine,
      lazy.SearchService.CHANGE_REASON.UNKNOWN
    );
  }
  Services.prefs.setBoolPref(DONE_PREF, true);
  return engine;
}

/**
 * Adds Yandex to the search engines of this profile, once, and makes it the
 * default in Russia.
 *
 * @returns {Promise<void>}
 */
export function ensureYandexSearch() {
  if (Services.prefs.getBoolPref(DONE_PREF, false)) {
    return Promise.resolve();
  }
  pending ??= addYandex()
    .then(() => {})
    .catch(error => {
      pending = null;
      console.error("Harbor: could not add Yandex search", error);
    });
  return pending;
}
