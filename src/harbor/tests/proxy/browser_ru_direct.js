/* Any copyright is dedicated to the Public Domain.
   https://creativecommons.org/publicdomain/zero/1.0/ */

"use strict";

const { isRussianHost } = ChromeUtils.importESModule(
  "chrome://browser/content/harbor/HarborRuDirect.mjs"
);

add_task(async function test_russian_hosts() {
  for (const host of [
    "yandex.ru",
    "mail.yandex.ru",
    "example.su",
    "xn--80aswg.xn--p1ai",
    "vk.com",
    "m.vk.com",
    "yastatic.net",
  ]) {
    ok(isRussianHost(host), `${host} goes direct`);
  }
});

add_task(async function test_other_hosts() {
  for (const host of [
    "",
    "example.com",
    "guru.com",
    "notvk.com",
    "vk.com.example.org",
    "ru.example.org",
  ]) {
    ok(!isRussianHost(host), `${host || "(empty)"} keeps its proxy`);
  }
});
