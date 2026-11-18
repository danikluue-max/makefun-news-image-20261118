# ART-BIBLE — "THE DAY IN ONE PICTURE" (news-image-20261118, round 6)

Infographic edition, round 6. Written BEFORE any layout code (art-bible
skill, Phase 2 core sections 1–4 + production sections 5–8 adapted to a
single image). Round 6 keeps round 5's dark board, serif masthead, real map
and fixed timeline, and changes ONE thing: readability. The parent proved
the gap at 300px wide — the #1 entry's big serif headlines partly read at
300px, ours (14px) did not. So the leads are rebuilt as 6 BIG cards with
24px headlines, and the old minis move into the ALSO list. We borrow the
readability principle only — never el-net's white newspaper, illustrations
or layout. Our board stays ours: dark, electric, mapped from real geography.

## 1. Visual Identity Statement

**One-line rule:** *The day is a dark dashboard with a broadsheet
nameplate — deep night, electric data, one accent per field, a map that
is really the world, and headlines big enough to read at 300 pixels wide.*

Supporting principles:
- **The date is the headline of the page.** The masthead must be the
  biggest thing on the board and read at any size; if it does not, the
  entry has failed criterion 1 (it names the day).
- **Big text carries the news; small text carries the proof.** The 6 lead
  headlines must read word-for-word at 300px wide. The 42-item list only
  has to show breadth — 42 numbered items in three columns — nobody is
  expected to read it word-for-word at 300px, and neither is the #1 entry's.
- **The map is evidence, not decoration.** Real country shapes from
  Natural Earth 110m, dots placed by real latitude/longitude. A blob map
  cannot be checked; a real one can.
- **Nothing touches a letter it should not.** A timeline dot, a map label
  or a halo that overlaps a glyph is a defect, full stop.

## 2. Mood & Atmosphere

- **Night desk, 23:00.** Deep navy #0B1220, the colour of a newsroom after
  dark. Not black — black is a void; navy is a room with the lights on.
- **Electric data.** Cyan #38BDF8 for the date's month and for politics,
  red #FF4D5E for war, amber #FBBF24 for money, emerald #34D399 for
  health. Each field owns one accent; no accent is reused for another field.
- **Calm, not loud.** The board is dense (48 stories) but ordered: one
  masthead, one hero row, one timeline, two lead rows, one map, one list.
  Every zone has exactly one job.

## 3. Shape Language

- **Cards, not columns of text.** Every story lives in a rounded card
  (#141E33 on #0B1220, 1px white-10% border, 10px radius). Cards are the
  unit; the eye reads card by card.
- **Flat hand-drawn scenes.** Each lead card carries a small flat SVG
  scene (40px strip) — a missile arc, a broken bridge, a skyline with
  flags, a ballot box, a virus. Simple shapes, no gradients, no photos.
- **The map is a rectangle of the real world.** Equirectangular, land
  #5A6B84, borders #8B9BB5, ocean #0E1626, 30° graticule. Dots glow with
  white rings; labels are bold white with a dark halo.

## 4. Color System

- Background #0B1220, card #141E33, map ocean #0E1626, land #5A6B84.
- Ink #F2F5FA, secondary #B9C4D6, muted #9AA8C0, faint #6B7A94.
- Accents: red #FF4D5E (war), cyan #38BDF8 (politics), amber #FBBF24
  (economy), lime #A3E635 (sport), violet #A78BFA (technology), teal
  #2DD4BF (science), pink #F472B6 (culture), orange #FB923C (climate),
  emerald #34D399 (health).
- **300px rule for colour:** at 300px wide, colour is what survives after
  text stops reading — the accent bars, the map dots, the hero numbers
  must still say which field each story belongs to.

## 5. Typography (the round 6 rule)

- **Masthead:** Playfair Display 900, 40px, one line. "WEDNESDAY **18
  NOVEMBER** 2026" — month in cyan.
- **Lead headlines:** Playfair Display 800, **24px, line-height 1.12**,
  short punchy wording (≤56 characters). Five headlines fit 2 lines; the
  first ("US strikes Guards site on Qeshm; Iran drones hit Bahrain", 56
  chars) needs 3 lines at any size ≥21px — measured with canvas
  measureText, it cannot fit 2 lines in a 303px card — so it stays verbatim
  (shortening it would drop "Guards") and the map gives up 22px instead.
  **Acceptance test: downscale the finished PNG to 300x300 and read all 6
  headlines word-for-word. If any headline does not read, make it bigger
  or shorter and re-render until all 6 read.** 24px is the size that
  passes; 14px (round 5) failed the same test.
- **Decks:** Liberation Sans 11px, one line, muted #B9C4D6. Decks are
  supporting text — they do not have to read at 300px.
- **Everything small stays sans:** kickers, timeline labels, map labels,
  field-bar labels, the ALSO list (11px), footer. At 300px a small serif
  turns to mush.
- **Font:** Playfair Display (variable, weights 400–900), vendored in
  `fonts/PlayfairDisplay.ttf`, SIL OFL 1.1 (see `fonts/OFL.txt`).
  Fallback stack: Georgia, "Liberation Serif", serif.

## 6. Layout & Spacing Budget (1024x1024, content width 992)

- Masthead block (toprow + nameplate + strapline): ~74px.
- Hero numbers: ~56px. Timeline: ~58px.
- Lead rows: 2 rows x 3 cards, card ~140px (40px scene + tag + 24px
  headline + deck + padding), rows ~288px total.
- Map zone: ~260px (244px map + header). Field bars beside it, 9 rows,
  values sum to 48.
- ALSO list: 42 items in 3 columns of 14, 11px, line-height 1.15.
- Footer: sources + fine print, ~31px.
- **Fit rule:** page scrollHeight must equal 1024 exactly (measured in
  Playwright, not eyeballed). If it overflows, take space from art strips
  and margins — never from text sizes. The footer must end inside the
  frame with slack, never cut.

## 7. Timeline Rule (from round 4, unchanged)

- 7px dots centred ON the 2px track (1.5px dark border + 1.5px colour
  ring = 10px visual). Header 6px above the track, event names 10px
  below it. 0 overlaps measured (dots inflated 2px for the ring vs every
  timeline text element). Last label "MEASLES STATUS LOST" right edge at
  x=1002, inside the board inner edge 1008 (6px margin) — it cannot clip.

## 8. Fact Discipline

- 48 stories, all verified from live news of 18 November 2026. 6 leads +
  42 in the list = 48. Field bars sum to 48 (Politics 10, War & defence 8,
  Economy 6, Sport 6, Technology 4, Science 4, Culture 4, Climate &
  disasters 4, Health 2).
- Shortening a headline never changes its fact. "US strikes Guards site
  on Qeshm; Iran drones hit Bahrain" is the same fact as the longer round
  5 wording, in fewer words.
- Sources footer: Reuters, AP, BBC, CNN, Al Jazeera, The Hindu, WHO,
  NASA JPL, IMD — 18 November 2026.
