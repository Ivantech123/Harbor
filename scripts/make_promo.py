# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Builds the promo images in docs/promo from the screenshots.

  python scripts/make_promo.py

Needs docs/screenshots (see take_screenshots.py) and Pillow.
"""

import os
import sys

from PIL import Image, ImageDraw, ImageFilter, ImageFont

SHOTS = os.path.join("docs", "screenshots")
OUT = os.path.join("docs", "promo")
FONT = os.path.join("src", "harbor", "fonts", "Manrope.ttf")
LOGO = os.path.join("configs", "branding", "release", "logo512.png")

BACKGROUND = (18, 26, 30)
ACCENT = (20, 152, 142)
TEXT = (240, 244, 245)
MUTED = (160, 176, 180)


def font(size, weight="Bold"):
  face = ImageFont.truetype(FONT, size)
  try:
    face.set_variation_by_name(weight)
  except (OSError, ValueError):
    pass
  return face


def rounded(image, radius):
  mask = Image.new("L", image.size, 0)
  ImageDraw.Draw(mask).rounded_rectangle(
    (0, 0, image.width, image.height), radius, fill=255)
  image = image.convert("RGBA")
  image.putalpha(mask)
  return image


def backdrop(size):
  """Dark canvas with a soft accent glow in the top right."""
  canvas = Image.new("RGB", size, BACKGROUND)
  glow = Image.new("RGB", size, BACKGROUND)
  draw = ImageDraw.Draw(glow)
  width, height = size
  draw.ellipse((width * 0.45, -height * 0.6, width * 1.25, height * 0.7),
               fill=(16, 74, 72))
  glow = glow.filter(ImageFilter.GaussianBlur(min(size) // 5))
  return Image.blend(canvas, glow, 0.9)


def paste_shot(canvas, name, box_width, position):
  shot = Image.open(os.path.join(SHOTS, name)).convert("RGB")
  scale = box_width / shot.width
  shot = shot.resize((box_width, round(shot.height * scale)), Image.LANCZOS)
  shot = rounded(shot, 14)

  shadow = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
  ImageDraw.Draw(shadow).rounded_rectangle(
    (position[0], position[1] + 12,
     position[0] + shot.width, position[1] + shot.height + 12),
    14, fill=(0, 0, 0, 150))
  shadow = shadow.filter(ImageFilter.GaussianBlur(24))
  canvas.paste(shadow, (0, 0), shadow)
  canvas.paste(shot, position, shot)


def wrap(draw, text, face, max_width):
  lines, line = [], ""
  for word in text.split():
    candidate = f"{line} {word}".strip()
    if draw.textlength(candidate, font=face) <= max_width:
      line = candidate
    else:
      lines.append(line)
      line = word
  if line:
    lines.append(line)
  return lines


def draw_block(draw, origin, title, body, title_face, body_face, max_width):
  x, y = origin
  for line in wrap(draw, title, title_face, max_width):
    draw.text((x, y), line, font=title_face, fill=TEXT)
    y += round(title_face.size * 1.12)
  y += round(body_face.size * 0.6)
  for line in wrap(draw, body, body_face, max_width):
    draw.text((x, y), line, font=body_face, fill=MUTED)
    y += round(body_face.size * 1.4)
  return y


def brand(canvas, draw, origin, size):
  logo = Image.open(LOGO).convert("RGBA").resize((size, size), Image.LANCZOS)
  canvas.paste(logo, origin, logo)
  draw.text((origin[0] + size + round(size * 0.28), origin[1] + size // 2),
            "Harbor", font=font(round(size * 0.62)), fill=TEXT, anchor="lm")


def banner(name, title, body, badge, shot):
  """1280x640, the size GitHub and link previews use."""
  canvas = backdrop((1280, 640))
  draw = ImageDraw.Draw(canvas)
  brand(canvas, draw, (64, 64), 64)
  bottom = draw_block(draw, (64, 196), title, body,
                      font(46), font(23, "Medium"), 500)

  badge_face = font(20, "SemiBold")
  width = round(draw.textlength(badge, font=badge_face)) + 36
  draw.rounded_rectangle((64, bottom + 26, 64 + width, bottom + 70), 22,
                         fill=ACCENT)
  draw.text((64 + width // 2, bottom + 48), badge, font=badge_face,
            fill=(255, 255, 255), anchor="mm")

  paste_shot(canvas, shot, 760, (620, 110))
  canvas.save(os.path.join(OUT, name), optimize=True)


def card(name, title, body, shot):
  """1080x1080, for a feed post."""
  canvas = backdrop((1080, 1080))
  draw = ImageDraw.Draw(canvas)
  brand(canvas, draw, (72, 72), 56)
  draw_block(draw, (72, 184), title, body, font(64), font(30, "Medium"), 936)
  paste_shot(canvas, shot, 1000, (72, 520))
  canvas.save(os.path.join(OUT, name), optimize=True)


def main():
  os.makedirs(OUT, exist_ok=True)

  banner("banner-ru.png",
         "Браузер, в котором вкладкам есть место",
         "Пространства, разделение экрана и вертикальные вкладки. "
         "На движке Firefox, без телеметрии.",
         "Открытая бета для Windows", "site.png")
  banner("banner-en.png",
         "A calmer way to keep your tabs",
         "Spaces, split view and vertical tabs. Built on Firefox, "
         "with no telemetry.",
         "Open beta for Windows", "site.png")

  card("card-spaces.png",
       "Вкладки по местам",
       "Вертикальная панель и пространства: работа, учёба и личное "
       "не мешают друг другу.",
       "main.png")
  card("card-split-view.png",
       "Две страницы рядом",
       "Разделение экрана — до четырёх вкладок в одном окне.",
       "split-view.png")
  card("card-mods.png",
       "Настройте под себя",
       "Встроенный магазин модов меняет внешний вид браузера в один клик.",
       "mods.png")
  print(f"Wrote {len(os.listdir(OUT))} files to {OUT}")


if __name__ == "__main__":
  try:
    main()
  except OSError as e:
    print(f"make_promo: {e}", file=sys.stderr)
    sys.exit(1)
