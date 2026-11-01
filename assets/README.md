# Assets — which image is current

An image cannot be patched like text, so this file says what each file shows. It is the source of
truth for citations that embed an image.

| File | What it shows | Status |
|---|---|---|
| `hero.png` | the README image; no version label in the graphic | **current** (1.0.1) |
| `hero-1080x1350.png` | Instagram crop of the 1.0 banner; carries "v1.0" | current for the 1.0 line — a patch release does not re-render it |
| `hero@2x.png` | the v0.3 draft banner: "DRAFT FOR PUBLIC REVIEW · NOT A STANDARD", "v0.3" | **archived** — kept for history, not part of 1.0.1; do not cite it as the current banner |
| `logo.png` | brand mark | current |

If the position ever changes its version label, the images are re-rendered in the same release that
changes the label. Until then, the version is the one in [`../laws/00-the-laws.md`](../laws/00-the-laws.md).
