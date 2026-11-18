#!/bin/sh
# Render the round-9 newspaper page to the 1024x1024 entry image.
#
# Pipeline, in my own words: find a Chromium, take a tall headless
# screenshot of page.html, then cut off the empty strip Chrome leaves
# below the page. The page layout is a fixed 1024x1024 square, so the
# crop is always the top square of the capture. Playfair is vendored
# under fonts/, so nothing here needs the network.
#
# Chromium source: $CHROME when set, otherwise the Playwright bundle
# on this machine. All paths are resolved from this script's own
# directory, so it works no matter where you call it from.

set -eu

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$DIR"

if [ -n "${CHROME:-}" ]; then
  BROWSER=$CHROME
else
  BROWSER="$HOME/.cache/ms-playwright/chromium-1148/chrome-linux/chrome"
fi

# Chrome's headless viewport comes out about 87px shorter than the
# window, so a 1111px window is what yields a 1024px viewport.
SHOT=$(mktemp --suffix=.png /tmp/r9-shot-XXXXXX)

"$BROWSER" \
  --headless=new \
  --no-sandbox \
  --disable-gpu \
  --hide-scrollbars \
  --force-device-scale-factor=1 \
  --virtual-time-budget=5000 \
  --window-size=1024,1111 \
  --screenshot="$SHOT" \
  "file://$DIR/page.html"

python3 - "$SHOT" "$DIR/entry.png" <<'PY'
import sys
from PIL import Image

shot_path, out_path = sys.argv[1], sys.argv[2]
with Image.open(shot_path) as shot:
    print("captured", shot.size)
    square = shot.crop((0, 0, 1024, 1024))
    square.save(out_path)
with Image.open(out_path) as done:
    print("entry", done.size, out_path)
PY

rm -f "$SHOT"
