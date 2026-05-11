---
name: framer-motion
description: Production animation for React using Motion (formerly Framer Motion). Use when adding animations, transitions, micro-interactions, scroll effects, page transitions, gesture handling, layout animations, or "make this feel less static / less AI-generated" to any React/Next.js site or app. Covers the `motion` package (`motion/react`), `AnimatePresence`, `layout`/`layoutId` shared-element transitions, `useScroll`/`useTransform`, `whileHover`/`whileTap`/`whileInView`, spring config, stagger, `prefers-reduced-motion`, and Next.js App Router gotchas. Pairs with ui-ux-pro-max (motion best-practice rules), emil-design-eng (motion taste/easing), 21st.dev Magic MCP + shadcn-ui (components to animate), frontend-design (overall aesthetic).
---

# Framer Motion (the `motion` package) — instant React animation

Framer Motion shipped as `framer-motion` for years; from v11 it's published as **`motion`** and you import from **`motion/react`**. New code should use `motion`. Old code importing `framer-motion` still works (it re-exports), but don't add new `framer-motion` imports.

## Install (per project)

```bash
npm i motion          # current package
# legacy alias still works: npm i framer-motion
```

Import:

```tsx
import { motion, AnimatePresence } from "motion/react"
// React Server Components: this is a client-only library — the file using it needs "use client"
```

## The 80% you reach for

**Mount/enter animation** — just swap the tag:

```tsx
<motion.div
  initial={{ opacity: 0, y: 12 }}
  animate={{ opacity: 1, y: 0 }}
  transition={{ duration: 0.25, ease: [0.16, 1, 0.3, 1] }}  // easeOutExpo-ish
>
```

**Hover / tap micro-interactions** (no layout shift — animate transform/opacity, never width/height):

```tsx
<motion.button whileHover={{ scale: 1.03 }} whileTap={{ scale: 0.97 }}>
```

**Scroll-reveal** (animate once when it enters the viewport):

```tsx
<motion.section
  initial={{ opacity: 0, y: 24 }}
  whileInView={{ opacity: 1, y: 0 }}
  viewport={{ once: true, amount: 0.3 }}
  transition={{ duration: 0.4 }}
/>
```

**Exit animation** — wrap in `AnimatePresence`, give a stable `key`, add `exit`:

```tsx
<AnimatePresence mode="wait">
  {open && (
    <motion.div key="panel" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} />
  )}
</AnimatePresence>
```

**Stagger children**:

```tsx
const list = { animate: { transition: { staggerChildren: 0.06 } } }
const item = { initial: { opacity: 0, y: 8 }, animate: { opacity: 1, y: 0 } }
<motion.ul variants={list} initial="initial" animate="animate">
  {items.map(i => <motion.li key={i.id} variants={item} />)}
</motion.ul>
```

**Shared-element / layout transitions** — `layout` auto-animates size/position changes; `layoutId` morphs one element into another across renders:

```tsx
<motion.div layout />                         // animates when its layout changes
<motion.div layoutId="card-3" />              // morph between two places that share the id
```

**Scroll-linked values** (parallax, progress bars):

```tsx
const { scrollYProgress } = useScroll()
const y = useTransform(scrollYProgress, [0, 1], [0, -200])
<motion.div style={{ y }} />
```

## Springs vs duration

- `transition={{ type: "spring", stiffness: 300, damping: 30 }}` — natural, physical; great for drags, toggles, layout.
- `transition={{ duration: 0.2, ease: "easeOut" }}` — predictable; great for fades and small UI state changes.
- Micro-interactions: **150–300ms**. Anything over ~500ms feels sluggish.

## Non-negotiables

- **Respect reduced motion.** Either gate animations on the OS setting or use the built-in:
  ```tsx
  import { MotionConfig } from "motion/react"
  <MotionConfig reducedMotion="user">{/* app */}</MotionConfig>
  ```
  Or `const reduce = useReducedMotion()` and skip/shrink animations when true.
- **Animate `transform` and `opacity`**, not `width`/`height`/`top`/`left` — those trigger layout and jank. Use `layout` if you genuinely need size to animate.
- **Stable `key`s in `AnimatePresence`**, or exit animations silently no-op.
- **Next.js App Router**: any file using `motion` needs `"use client"`. For route-change page transitions you need a `template.tsx` (re-mounts on navigation) wrapping children in `AnimatePresence`, since the App Router won't unmount layouts.
- Don't animate everything. Motion should guide attention (entrances, state changes, feedback), not decorate every element.

## Where this sits in the website stack

1. `ui-ux-pro-max --design-system` → direction + the motion rules
2. `21st.dev Magic MCP` / `shadcn-ui` → the components
3. `frontend-design` → distinctive aesthetic
4. **this skill** → wire the motion: entrances, hovers, scroll reveals, layout transitions
5. `emil-design-eng` → tune the easing/feel if it still feels off
6. `web-design-guidelines` + `web-accessibility` → review (incl. reduced-motion check)

## Reference docs

- Docs: https://motion.dev/docs/react
- Emil Kowalski's animation writing (taste, easing, when-not-to-animate) — see the `emil-design-eng` skill.
