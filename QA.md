# Chef 30 quality report

## Package contract

- Format: Codex Pet v2
- Atlas: 1536×2288 RGBA WebP
- Grid: 8 columns × 11 rows; each cell is 192×208
- Core animation frame counts: 6 / 8 / 8 / 4 / 5 / 8 / 6 / 6 / 6
- Gaze directions: 16, from 000° to 337.5° in 22.5° increments

## v2.1 hover stability

- All five used hover cells have the same SHA-256 and identical decoded pixels.
- The hover preview GIF collapses to one frame, so remaining hovered is completely still.
- Only atlas row 4 changed from v2; decoded-pixel differences for every other row are zero.
- Identity, palette, proportions, baseline, transparency, crop, and ball-to-hand contact passed independent visual review.

## Final validation

- Atlas validator: `ok=true`
- Errors: 0
- Warnings: 0
- Transparent RGB residue: 0 pixels
- Direction blind review: passed across three review rounds
- Visual QA: passed with no blocking artifacts

Machine-readable reports are available in [`qa/`](qa/).
