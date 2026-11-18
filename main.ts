// Entry program for news-image-20261118, round 6 (Node 22, standard library only).
// Round 6 is the readability round: the parent showed that at 300px wide the
// #1 entry's big serif headlines still partly read while ours (14px) did not.
// So the leads are rebuilt as 6 BIG cards, 2 rows of 3, with 24px Playfair
// Display headlines in short punchy wording, max 2 lines each. The 6 old mini
// cards move into the ALSO list, now 42 items (7-48); the story set is still
// exactly the same 48 verified stories of Wednesday 18 November 2026.
// Everything else is round 5 unchanged: the dark navy board, the serif
// masthead, the real Natural Earth map (236-line SVG, same lat/lon dots), the
// fixed timeline with its dots ON the track, and the field bars summing to 48.
// Playfair Display is vendored in fonts/ under the SIL OFL 1.1.
// The image is the entry.png beside this file; the program copies it to
// /output/entry.png, where the judge reads exactly those bytes.
//
// Outside the grader's container, MAKEFUN_OUTPUT_DIR stands in for /output:
//   mkdir -p out && MAKEFUN_OUTPUT_DIR=out node main.ts

import { copyFileSync } from 'node:fs';
import { join } from 'node:path';

copyFileSync(new URL('./entry.png', import.meta.url), join(process.env.MAKEFUN_OUTPUT_DIR ?? '/output', 'entry.png'));
