# Category Groups annotation design QA

- Source visual truth: `D:\NAS\project\VisLab\category-annotations-before.png` plus the user's three browser annotations
- Implementation screenshot: `D:\NAS\project\VisLab\category-annotations-after.png`
- Route: `https://bbs.hkustvis.org/categories`
- Source viewport: 1265 × 711 (in-app browser)
- Implementation viewport: 1265 × 711 (in-app browser)
- State: signed-in desktop, light mode, all five category groups expanded

## Full-view comparison evidence

The source and implementation were opened together in one comparison input at the same viewport. The final implementation preserves the established two-column layout, row rhythm, and pastel grouping while aligning each colored rail exactly to its ribbon's outer edge. The header logo retains its existing visual position but its link box now reserves additional space on the right.

## Focused comparison evidence

A separate crop was not required because the annotated rail, category title, Latest title, and logo are legible in the full-size 1265 × 711 comparison. Computed-style inspection supplied the precise focused evidence: the rail and ribbon both begin at x=88.22px and the logo link has 16px right padding.

## Required fidelity surfaces

- Fonts and typography: passed. The existing Inter stack is preserved. Group headings use 16px/600 and category names use 16px/500, establishing hierarchy beneath the 18.38px Latest titles. Left topic counts also use 500 instead of 700.
- Spacing and layout rhythm: passed. Every body category row retains the unread-row rhythm (55.19px), while the header keeps its native 36.48px height and aligns with Latest. The rail shares the ribbon's outer edge, and the logo link reserves 16px on its right.
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
- Pass 4: the user's follow-up annotation requested outer-edge alignment. The rail offset changed from 4px to 0px, producing an exact x-coordinate match with the ribbon. The 18.3792px title-size equality was reconfirmed, and 16px right padding was added to the header logo link. No P0/P1/P2 findings remain.

## Implementation checklist

- [x] Add configurable group accent tokens.
- [x] Apply the exact group pastel to each heading ribbon and divider.
- [x] Harmonize all twenty category rails and squares by group.
- [x] Normalize every category row to the unread-row height.
- [x] Reduce left-panel title and count weights.
- [x] Establish a smaller left-category scale beneath group headings and Latest titles.
- [x] Align the group rail to the ribbon's outer edge.
- [x] Keep body-row rhythm without applying it to the table header.
- [x] Add 16px of right padding to the header logo link.
- [x] Verify light and dark modes.
- [x] Verify collapse/expand and Latest topics.

final result: passed
