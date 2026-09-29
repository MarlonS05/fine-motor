# Design system — Fine Motor

> Visual language for the Fine Motor tremor assessment app.
> Source: [Figma Make — Tremor Fine Motor Test App](https://www.figma.com/make/VgSMiuem6GoYi4oIeq3LBN/Tremor-Fine-Motor-Test-App)
> Audience: coding agents. Do not invent alternate palettes or radii.

Brand product name in UI copy: **Fine Motor** (Figma Make prototype text says “NeuroMotor” — do not ship that name). Clinical, calm, soft-medical aesthetic with Memphis-lite geometric accents on dark headers only.

---

## Theme & surfaces

- **Outer chrome / page backdrop:** `#E8EDF4`
- **App column surface (phone frame):** `#F0F4F8`
- **Active test workspace:** `#F8FAFC`
- **Canvas / drawing board:** `#FAFCFF`
- **Cards / sheets on light:** `#FFFFFF`
- **Dark hero / summary bands:** `#1E2A45`
- **Dark translucent inset (on navy):** `rgba(255,255,255,0.07)` fill + `1px solid rgba(255,255,255,0.1)` border

App is framed as a narrow mobile column (`max-w-sm` ≈ 384px) centered on the outer backdrop. Hide scrollbars; no overscroll bounce emphasis; tap highlight off.

---

## Color tokens

### Brand & neutrals

- **Navy (primary dark / titles on light):** `#1E2A45`
- **Teal accent (brand primary CTA / progress / success-on-dark):** `#00B5A6`
- **Teal bright (on-target highlight variant):** `#00D4C8`
- **Gold accent (decorative + track “idle” highlight):** `#FFD166`
- **Muted on navy:** `#7B8FAB`
- **Body secondary (instructions):** `#5A6478`
- **Body tertiary (labels, captions):** `#9BA3B5`
- **Hint / duration muted:** `#B0B7C3`
- **Footer whisper:** `#C0C7D0`
- **Inactive progress / empty chips:** `#D8DDE6` or `#E8EDF4`
- **Icon-button fill (light):** `#F0F4F8`
- **Back-chevron stroke:** `#5A6478`
- **White:** `#FFFFFF`

### Task accent pairs (accent + soft tint)

Each assessment task owns one accent and a matching pastel fill. Use the pair for icon tiles, progress segments, completed outlines, primary CTAs on that task, and score badges.

- **Line (teal):** accent `#00B5A6`, tint `#D9F5F3`
- **Path / spiral (violet):** accent `#7C6FCD`, tint `#EAE7FF`
- **Track (amber):** accent `#F59E0B`, tint `#FFF3D0`
- **Tap (red):** accent `#EF4444`, tint `#FFE4E4`

### Semantic / feedback

- **Error / off-path / miss:** `#EF4444` (also used as solid fill dots at ~45–50% opacity on canvases)
- **On-target (tracking):** swap amber → teal (`#00B5A6` / `#00D4C8`)
- **Timer warning:** switch timer stroke from teal to `#EF4444` when remaining < ~30%
- **Miss ripple:** `rgba(156,163,175,0.3)` gray pulse
- **Hit ripple:** `rgba(239,68,68,0.3)`
- **Score badge wash:** accent + `22` hex alpha (≈13% opacity), text = accent
- **Primary CTA glow:** `0 4px 20px {accent}55` (≈33% opacity shadow)

### Canvas / guide paints

- **Dot grid:** `rgba(160,175,200,0.18–0.25)`, 1px dots on ~20px pitch
- **User stroke:** `#1E2A45`, ~2.5px, round caps/joins
- **Guide band (soft fat stroke):** task accent at ~8–15% opacity, wide stroke (~14–22px)
- **Guide dashed line:** task accent at ~35–40% opacity, dash ~5–6 / gap ~4–5, stroke ~2–3px
- **Start marker:** filled accent circle (~7px r)
- **End marker:** white fill + accent stroke (~2–2.5px)
- **Trail ghosts (track):** amber at very low alpha fading with age

---

## Typography

Fonts (load both; do not substitute Inter/Nunito with system defaults in product UI):

- **Display / headings / black CTAs / scores:** Nunito — weights 400–900; UI uses **black (900)** for titles and primary buttons, **bold** for card titles
- **Body / UI / canvas labels:** Inter — weights 400–700; default body

Hierarchy (approximate Tailwind sizes used in Make):

- Hero title: ~24px (`text-2xl`), Nunito black, white on navy; tight leading; may break across lines
- Brand eyebrow: ~12px, Inter/Nunito bold, **uppercase**, `tracking-widest`, teal `#00B5A6`
- Section labels: ~12px, semibold/bold, **uppercase**, `tracking-wider`, `#9BA3B5`
- Card title: ~14px, Nunito bold, `#1E2A45`
- Card subtitle / meta: ~12px, `#9BA3B5`
- Body / instructions: ~14px, `#5A6478` or `#3A4460` for numbered steps
- Score numeral (ring): ~24px Nunito black `#1E2A45`; `/ 100` caption 12px `#9BA3B5`
- Primary button label: ~16px Nunito black, white
- Footer: ~12px `#C0C7D0`

---

## Shape & radius

Rounded, soft clinical — prefer large radii; avoid sharp rectangles except tiny decorative Memphis squares.

- **Pill / chip / progress segment / score grade:** `rounded-full`
- **Primary / secondary full-width buttons:** `rounded-2xl` (~16px)
- **List cards:** `rounded-2xl`
- **Intro / result hero panels:** `rounded-3xl` (~24px)
- **Icon tiles (14×14 / 10×10 blocks):** `rounded-xl` (~12px)
- **Avatar circle:** `rounded-full` (40×40 clinician, etc.)
- **Back control:** `rounded-full` 36×36
- **Canvas board:** `borderRadius: 16px`
- **Decorative Memphis square:** ~8×8, `borderRadius: 4px`, rotated 45°
- **Decorative circles:** various sizes, low opacity on navy header only

Stroke accents: completed task cards use **2px solid** outline in task accent (instead of default soft shadow).

---

## Elevation & borders

- Default card: `0 1px 3px rgba(0,0,0,0.06)`
- Result score card: `0 2px 16px rgba(0,0,0,0.06)`
- Canvas: `0 2px 12px rgba(0,0,0,0.06)`
- Test shell header: white bar + bottom border `1px solid #F0F4F8`
- Pressed cards / CTAs: `active:scale-[0.98]` (slight press scale)

No heavy multi-layer shadows; no glow beyond the teal/accent CTA soft shadow.

---

## Spacing & layout chrome

- Horizontal page padding: **20px** (`px-5`) common
- Card internal padding: **16px** (`p-4`); intro panels larger (`p-8`)
- Vertical stacks between cards: ~12px (`space-y-3`)
- Progress strip: 4 thin segments, height ~6px (`h-1.5`), gap 4px
- Icon tile: **56×56** (`w-14 h-14`) on home cards; smaller 36–40px tiles in dark patient/session chrome
- Numbered instruction bullets: 20×20 filled accent circles with white index
- Task color status pip: 12×12 circle in test headers

---

## Component chrome patterns (visual only)

These are recurring visual patterns, not screen specs:

- **Primary filled button:** full width, accent or navy fill, white Nunito black label, optional accent glow shadow
- **Secondary outline button:** transparent fill, 2px accent border, accent label
- **Ghost cancel:** text-only, `#9BA3B5`
- **Score grade chip:** pill with accent-tinted wash + accent text (Excellent / Good / Fair / Low thresholds: ≥85 / ≥65 / ≥45)
- **Score ring:** 8px track `#E8EDF4`, arc in task accent, round linecap; centered score
- **Icon + tint tile:** pastel `bg` square/rounded-xl with stroke-style SVG icon in matching accent
- **Dark header band:** navy with low-opacity teal/gold/violet geometric blobs and a teal 4px bottom accent line

---

## Iconography

Custom stroke SVGs (not Material fill sets): ~2–3.5px stroke, round caps, accent-colored. Motifs: wavy path, spiral, concentric target + motion arrow, tap finger/circles. Prefer outline + small solid dots over filled pictograms.

---

## Motion

Sparse, purposeful:

- Progress segment fill color transitions ~500ms
- Score ring dash draw ~1s ease
- Tap hit: short ping/ripple (~500ms)
- Target appear: ping outer ring (tap targets)
- Press feedback: 0.98 scale on cards/CTAs
- Track target trail: soft fading ghost discs

Avoid decorative continuous animation outside assessment feedback.

---

## Do / don’t for agents

- Do map Flutter/theme tokens 1:1 to the hex values above.
- Do keep task accent + tint pairs coupled.
- Do use Nunito for display/CTA, Inter for body.
- Don’t introduce purple-indigo gradients, cream/terracotta themes, or sharp newspaper layouts.
- Don’t put Memphis decorative shapes on light content areas — only on navy headers.
- Don’t describe or invent screen content here; implement screens from feature design specs that reference this file.
