# Category Groups spacing and typography design QA

- Source visual truth: `D:\NAS\project\VisLab\category-spacing-before.png` plus the user's spacing, weight, and inset-rail annotation
- Implementation screenshot: `D:\NAS\project\VisLab\category-spacing-final-v2.png`
- Route: `https://bbs.hkustvis.org/categories`
- Source viewport: 1265 × 711 (in-app browser)
- Implementation viewport: 1265 × 711 (in-app browser)
- State: signed-in desktop, light mode, all five category groups expanded

## Full-view comparison evidence

The source and implementation were opened together in one comparison input at the same viewport. The final implementation keeps the compact category table and native Latest list, while giving every category row the same height as an unread row. This removes the alternating compressed/expanded rhythm without changing the two-column proportions or Latest content.

## Focused comparison evidence

A separate crop was not required because the category names, row dividers, and rails are legible in the full-size 1265 × 711 comparison. Computed-style inspection supplied the precise focused evidence: all sampled rows are 55.19px tall; left category names and right Latest titles are both 18.38px; left names use 500 weight against Latest's 400; and the 3px group rail starts 4px inside the category cell rather than on the table edge.

## Required fidelity surfaces

- Fonts and typography: passed. The existing Inter stack is preserved. Left category names now match Latest's 18.38px scale and use a restrained 500 weight; left topic counts also use 500 instead of 700. Wrapping and line heights remain native to Discourse.
- Spacing and layout rhythm: passed. Every category row now uses the unread-row rhythm (55.19px), with middle-aligned cells. Table tracks, header spacing, and Latest-column proportions remain intact.
- Colors and visual tokens: passed. The five group tokens are `#B5E1E6`, `#D8E8C8`, `#D8D1F0`, `#FFEEDB`, and `#FFD4CA`. Within each group, the ribbon, divider, category rails, and category squares use the exact same token. Light and dark modes were both checked.
- Image quality and asset fidelity: unchanged source avatars, logo, and category imagery; no assets were replaced or approximated.
- Copy and content: unchanged; all category names, counts, unread states, and Latest-topic content remain live Discourse data.

## Findings

No actionable P0, P1, P2, or P3 differences remain.

## Interaction and runtime checks

- Category group collapse and re-expand: passed (4 → 0 → 4 visible rows).
- Native Latest column: present.
- Five category group headings: present.
- Clean-page browser console errors: none.

## Comparison history

- Pass 1: row heights were normalized and left weights reduced, but computed evidence showed the nested category title still rendered at 21.11px while Latest rendered at 18.38px; the first inset shadow also remained visually attached to the table edge. Classified as P2 typography and rail-alignment drift.
- Pass 2: the rail was moved to a 3px rule positioned 4px inside the category cell. The rail passed, but the nested title scale still compounded to 21.11px. The title inheritance was corrected so only the heading establishes the 18.38px scale.
- Pass 3: the same-viewport comparison and computed styles confirmed 55.19px rows, 18.38px category and Latest titles, 500/400 left-right weight balance, and a 4px-inset rail. No P0/P1/P2 findings remain.

## Implementation checklist

- [x] Add configurable group accent tokens.
- [x] Apply the exact group pastel to each heading ribbon and divider.
- [x] Harmonize all twenty category rails and squares by group.
- [x] Normalize every category row to the unread-row height.
- [x] Reduce left-panel title and count weights.
- [x] Match the left title size to native Latest titles.
- [x] Move the group rail 4px inside the category cell.
- [x] Verify light and dark modes.
- [x] Verify collapse/expand and Latest topics.

final result: passed
