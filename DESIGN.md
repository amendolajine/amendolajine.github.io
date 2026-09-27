# DESIGN.md - the personal design system (master copy lives in the website repository; keep under 120 lines)

Owner: Antonio. Status: draft until the first real pages exist. Claude Design reads this through `/design-sync`; code is the master, Claude Design is the copy.

## Voice of the brand (one paragraph)
Modern, dry, precise. Never corporate. The person comes through: sarcasm where earned, philosophy kept light, computer-science mind behind marketing craft.

## Colour roles (values live in src/styles/tokens.css)
- background, surface, text, text-muted, accent, accent-strong, border, success, warning, danger.
- One accent only. Colour never carries meaning alone (use shape or text too).

## Type
- One family for headings and body (choose deliberately; no default system font, no trend font). Tabular figures for numbers.
- Scale: 6 sizes from a single ratio. Line length 60 to 75 characters.

## Spacing and shape
- One base unit; every spacing value is a multiple. One radius value. Hairline borders, no drop shadows except real overlays.

## Motion
- Only when data changes or focus moves. Durations under 300 ms, real ease-out curves, never spring or bounce on ordinary interface.

## Do not
- Gradients, glass effects, rows of identical icon cards, decorative animation, stock-photo aesthetics, generic template look, flat corporate illustration style.

## Reference examples (paths in brand/)
- brand/logo/, brand/fonts/, brand/references/ (3 to 5 screenshots of pages Antonio likes, with one line each on why).

## Sync rule
Any change to tokens.css or this file: commit, then run /design-sync from Claude Code in this repository. Designs go back to code only through the handoff bundle into a branch, never by hand-copying values.
