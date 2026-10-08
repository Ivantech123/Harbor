<!--
   - This Source Code Form is subject to the terms of the Mozilla Public
   - License, v. 2.0. If a copy of the MPL was not distributed with this
   - file, You can obtain one at http://mozilla.org/MPL/2.0/.
   -->

# Promo material

Images and texts for announcing Harbor. The images are generated:

```sh
python scripts/take_screenshots.py --binary <path to harbor.exe>   # docs/screenshots
python scripts/make_promo.py                                        # docs/promo
```

## Images

| File | Size | Use |
| --- | --- | --- |
| `banner-ru.png`, `banner-en.png` | 1280×640 | Link previews, the repository social image, post headers |
| `card-spaces.png` | 1080×1080 | Feed post: vertical tabs and spaces |
| `card-split-view.png` | 1080×1080 | Feed post: split view |
| `card-mods.png` | 1080×1080 | Feed post: the mod store |

Plain screenshots are in [`../screenshots`](../screenshots).

## Texts

- [`telegram-ru.md`](telegram-ru.md) — launch post for Telegram, Russian
- [`short-en.md`](short-en.md) — short description, English

## Credits

The screenshots show articles from Russian Wikipedia, which are available
under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
