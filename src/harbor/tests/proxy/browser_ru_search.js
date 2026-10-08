/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const { ensureYandexSearch, YANDEX_ENGINE } = ChromeUtils.importESModule(
  "chrome://browser/content/harbor/HarborRuSearch.mjs"
);

add_task(async function test_yandex_is_added_and_default_in_russia() {
  Assert.equal(
    Services.prefs.getStringPref("browser.search.region"),
    "RU",
    "The build is set to the Russian search region"
  );
  await ensureYandexSearch();

  const engine = Services.search.getEngineByName(YANDEX_ENGINE.name);
  ok(engine, "Yandex is among the search engines");
  Assert.equal(
    engine.getSubmission("harbor browser").uri.spec,
    "https://yandex.ru/search/?text=harbor+browser",
    "It searches on yandex.ru"
  );
  Assert.equal(
    (await Services.search.getDefault()).name,
    YANDEX_ENGINE.name,
    "It is the default engine"
  );
  ok(
    Services.prefs.getBoolPref("harbor.search.yandex.added"),
    "Adding it is remembered"
  );

  // The user's own choice is left alone afterwards.
  const other = (await Services.search.getVisibleEngines()).find(
    candidate => candidate.name !== YANDEX_ENGINE.name
  );
  await Services.search.setDefault(
    other,
    Services.search.CHANGE_REASON.UNKNOWN
  );
  await ensureYandexSearch();
  Assert.equal(
    (await Services.search.getDefault()).name,
    other.name,
    "A later start does not change the default back"
  );
  await Services.search.setDefault(
    engine,
    Services.search.CHANGE_REASON.UNKNOWN
  );
});
