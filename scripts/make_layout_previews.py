# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Draws the layout previews shown in the settings.

  python scripts/make_layout_previews.py

The three pictures are schematic on purpose: no text and no site logos, so
they need no translation and age with the interface, not with a screenshot.
"""

import os

from PIL import Image, ImageDraw, ImageFilter

OUT = os.path.join("src", "harbor", "images", "layouts")
LOGO = os.path.join("configs", "branding", "release", "logo128.png")

SIZE = (822, 571)
SCALE = 3  # drawn large and scaled down, for smooth edges

BACKDROP_TOP = (16, 84, 80)
BACKDROP_BOTTOM = (18, 26, 30)
WINDOW = (30, 39, 44)
PANEL = (41, 52, 58)
PANEL_LIGHT = (58, 72, 79)
LINE = (70, 86, 94)
ICON = (150, 168, 175)
TEXT = (205, 216, 220)
MUTED = (112, 130, 138)
ACCENT = (20, 152, 142)
PAGE = (244, 246, 247)

# Where the window sits: its top left corner, the rest runs off the picture.
LEFT, TOP = 254, 168


def s(value):
  return round(value * SCALE)


class Canvas:
  def __init__(self):
    self.image = self._backdrop()
    self.draw = ImageDraw.Draw(self.image)

  def _backdrop(self):
    width, height = s(SIZE[0]), s(SIZE[1])
    image = Image.new("RGB", (width, height), BACKDROP_BOTTOM)
    draw = ImageDraw.Draw(image)
    for y in range(height):
      mix = y / height
      draw.line(
        [(0, y), (width, y)],
        fill=tuple(round(a + (b - a) * mix)
                   for a, b in zip(BACKDROP_TOP, BACKDROP_BOTTOM)))
    glow = Image.new("RGB", (width, height), (0, 0, 0))
    ImageDraw.Draw(glow).ellipse(
      (-width * 0.3, -height * 0.5, width * 0.6, height * 0.6),
      fill=(26, 120, 112))
    glow = glow.filter(ImageFilter.GaussianBlur(s(70)))
    return Image.blend(image, Image.composite(glow, image, glow.convert("L")), 0.55)

  def box(self, x, y, width, height, fill, radius=0):
    self.draw.rounded_rectangle(
      (s(x), s(y), s(x + width), s(y + height)), s(radius), fill=fill)

  def line(self, x1, y1, x2, y2, fill=LINE, width=1.4):
    self.draw.line((s(x1), s(y1), s(x2), s(y2)), fill=fill, width=s(width))

  def dot(self, x, y, radius, fill):
    self.draw.ellipse(
      (s(x - radius), s(y - radius), s(x + radius), s(y + radius)), fill=fill)

  def ring(self, x, y, radius, fill=ICON, width=1.6):
    self.draw.ellipse(
      (s(x - radius), s(y - radius), s(x + radius), s(y + radius)),
      outline=fill, width=s(width))

  def chevron(self, x, y, direction, fill=ICON):
    reach = 5 * direction
    self.draw.line(
      (s(x + reach), s(y - 6), s(x - reach), s(y), s(x + reach), s(y + 6)),
      fill=fill, width=s(1.8), joint="curve")

  def plus(self, x, y, fill=ICON):
    self.line(x - 6, y, x + 6, y, fill, 1.8)
    self.line(x, y - 6, x, y + 6, fill, 1.8)

  def logo(self, x, y, size):
    logo = Image.open(LOGO).convert("RGBA").resize(
      (s(size), s(size)), Image.LANCZOS)
    self.image.paste(logo, (s(x), s(y)), logo)

  def save(self, name):
    image = self.image.resize(SIZE, Image.LANCZOS)
    image.save(os.path.join(OUT, name), optimize=True)


def window(canvas):
  """The window frame, with a soft shadow behind it."""
  shadow = Image.new("RGBA", canvas.image.size, (0, 0, 0, 0))
  ImageDraw.Draw(shadow).rounded_rectangle(
    (s(LEFT - 4), s(TOP + 6), s(SIZE[0] + 40), s(SIZE[1] + 40)), s(14),
    fill=(0, 0, 0, 170))
  shadow = shadow.filter(ImageFilter.GaussianBlur(s(16)))
  canvas.image.paste(shadow, (0, 0), shadow)
  canvas.draw = ImageDraw.Draw(canvas.image)
  canvas.box(LEFT, TOP, SIZE[0], SIZE[1], WINDOW, 12)


def navigation(canvas, x, y):
  canvas.chevron(x, y, 1)
  canvas.chevron(x + 34, y, -1, MUTED)
  canvas.ring(x + 70, y, 7, MUTED)


def url_bar(canvas, x, y, width):
  canvas.box(x, y, width, 34, PANEL, 9)
  canvas.ring(x + 18, y + 16, 5.5)
  canvas.line(x + 22, y + 20, x + 26, y + 24, ICON, 1.8)
  canvas.box(x + 38, y + 14, min(150, width - 60), 6, MUTED, 3)


def essentials(canvas, x, y, width):
  half = (width - 8) / 2
  canvas.box(x, y, half, 44, PANEL, 9)
  canvas.logo(x + half / 2 - 10, y + 12, 20)
  canvas.box(x + half + 8, y, half, 44, PANEL, 9)
  canvas.dot(x + half + 8 + half / 2, y + 22, 9, ACCENT)


def tab_row(canvas, x, y, width, label, selected=False, tint=ICON):
  if selected:
    canvas.box(x, y, width, 36, PANEL_LIGHT, 9)
  canvas.dot(x + 18, y + 18, 7, tint)
  canvas.box(x + 36, y + 15, label, 6, TEXT if selected else MUTED, 3)
  if selected:
    canvas.line(x + width - 22, y + 13, x + width - 12, y + 23, ICON, 1.6)
    canvas.line(x + width - 12, y + 13, x + width - 22, y + 23, ICON, 1.6)


def tab_list(canvas, x, y, width):
  canvas.box(x + 8, y + 6, 70, 6, MUTED, 3)  # space name
  tab_row(canvas, x, y + 26, width, 120, tint=(214, 222, 226))
  tab_row(canvas, x, y + 66, width, 86, tint=(238, 176, 74))
  canvas.line(x + 2, y + 112, x + width - 2, y + 112)
  canvas.plus(x + 18, y + 136)
  canvas.box(x + 36, y + 133, 60, 6, MUTED, 3)
  tab_row(canvas, x, y + 162, width, 60, selected=True, tint=ACCENT)


def page(canvas, x, y):
  canvas.box(x, y, SIZE[0], SIZE[1], PAGE, 8)


def single_toolbar():
  """Everything lives in the sidebar, the address bar included."""
  canvas = Canvas()
  window(canvas)
  x, width = LEFT + 8, 276
  canvas.dot(x + 12, TOP + 20, 2, ICON)
  canvas.dot(x + 19, TOP + 20, 2, ICON)
  canvas.dot(x + 26, TOP + 20, 2, ICON)
  navigation(canvas, x + width - 78, TOP + 20)
  url_bar(canvas, x, TOP + 42, width)
  essentials(canvas, x, TOP + 86, width)
  tab_list(canvas, x, TOP + 144, width)
  page(canvas, LEFT + width + 16, TOP + 8)
  canvas.save("single-toolbar.png")


def multiple_toolbar():
  """Tabs in the sidebar, navigation and the address bar on top."""
  canvas = Canvas()
  window(canvas)
  x, width = LEFT + 8, 276
  canvas.ring(x + 14, TOP + 20, 7)
  essentials(canvas, x, TOP + 42, width)
  tab_list(canvas, x, TOP + 100, width)
  content = LEFT + width + 16
  navigation(canvas, content + 14, TOP + 20)
  url_bar(canvas, content + 110, TOP + 4, 400)
  page(canvas, content, TOP + 42)
  canvas.save("multiple-toolbar.png")


def collapsed():
  """The sidebar shrinks to icons."""
  canvas = Canvas()
  window(canvas)
  x, width = LEFT + 6, 36
  center = x + width / 2
  canvas.ring(center, TOP + 20, 7)
  canvas.box(x, TOP + 42, width, 36, PANEL, 9)
  canvas.logo(center - 10, TOP + 50, 20)
  canvas.box(x, TOP + 84, width, 36, PANEL, 9)
  canvas.dot(center, TOP + 102, 8, ACCENT)
  canvas.dot(center, TOP + 146, 7, (214, 222, 226))
  canvas.dot(center, TOP + 186, 7, (238, 176, 74))
  canvas.line(x + 4, TOP + 214, x + width - 4, TOP + 214)
  canvas.plus(center, TOP + 238)
  canvas.box(x, TOP + 262, width, 36, PANEL_LIGHT, 9)
  canvas.dot(center, TOP + 280, 7, ACCENT)
  content = LEFT + width + 12
  navigation(canvas, content + 14, TOP + 20)
  url_bar(canvas, content + 110, TOP + 4, 440)
  page(canvas, content, TOP + 42)
  canvas.save("collapsed.png")


if __name__ == "__main__":
  single_toolbar()
  multiple_toolbar()
  collapsed()
  print(f"Wrote the layout previews to {OUT}")
