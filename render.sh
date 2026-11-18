#!/bin/sh
# Render page.html to entry.png at exactly 1024x1024 with headless Chromium.
# Round 6: the readability round — 6 big lead cards with 24px Playfair
# headlines, 42-item ALSO list, same real Natural Earth map and fixed
# timeline as round 5. Playfair is vendored in fonts/, so the render needs
# no network. Uses the Playwright-bundled Chromium (override with CHROME).
set -e
cd "$(dirname "$0")"
CHROME="${CHROME:-$HOME/.cache/ms-playwright/chromium-1148/chrome-linux/chrome}"
# Headless Chrome's viewport comes out ~87px shorter than the window, so a
# 1024px-tall viewport needs --window-size height 1111.
"$CHROME" --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1024,1111 \
  --virtual-time-budget=5000 \
  --screenshot="$PWD/.entry-full.png" "file://$PWD/page.html"
# The capture is 1024x1111; the page itself is exactly 1024 tall, so crop
# the blank strip at the bottom to meet the 1024x1024 gate.
python3 -c "from PIL import Image; im=Image.open('.entry-full.png'); im.crop((0,0,1024,1024)).save('entry.png'); print(im.size, '->', Image.open('entry.png').size)"
rm -f .entry-full.png
ls -l entry.png
