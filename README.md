# Website Stack

Build and ship a production-grade website with Claude Code — design, build, polish, motion, and a real launch on your own domain.

This repo is an **orchestration layer**. It does not re-host anyone else's work. It points Claude Code at five existing, open-source Claude Code skills (credited below), wires in one component MCP, ships one small generic skill of its own (`framer-motion`), and gives you a single master prompt that runs the whole flow end to end.

## Quick start

1. Open Claude Code in an empty folder.
2. Paste the contents of [`THE-PROMPT.md`](./THE-PROMPT.md) into Claude Code.
3. Answer the three questions it asks (your business, your domain, light or dark).
4. It installs the stack, builds the site, polishes it, animates it, and deploys it.

That's it. The prompt handles installs and self-heals if anything is missing.

## The stack

| # | What it does | Skill / tool |
|---|---|---|
| 1 | **Design direction** — picks the style, colour palette, font pairing and section order from a tested library before any code is written | `ui-ux-pro-max` ([github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), MIT) |
| 2 | **The build** — writes the real page and drops in polished components (hero, pricing, nav, footer) | `frontend-design` (Anthropic) + `shadcn-ui` skill (shadcn/ui ecosystem) + **21st.dev Magic MCP** ([21st.dev](https://21st.dev)) |
| 3 | **The taste pass** — strips the "made by AI" look and tightens the details until it reads expensive | `impeccable` + `emil-design-eng` (open-source skills, Apache 2.0; built on Anthropic's frontend-design and Emil Kowalski's [animations.dev](https://animations.dev)) |
| 4 | **The motion** — scroll fade-ins, hover micro-interactions, smooth page transitions, all `prefers-reduced-motion` aware | `framer-motion` (in this repo, `skills/framer-motion`) — wraps the open-source [`motion`](https://motion.dev) library |
| 5 | **The launch** — hosting, custom domain, SSL, analytics, tracking and forms | `vercel-deployment` (from the `erichowens/skills` collection, MIT) |

The prompt also installs three review skills: `nextjs-app-router-expert`, `web-accessibility`, `web-design-guidelines`.

> **Note on the 21st.dev Magic MCP:** the free tier has a limited number of component generations; "Magic Generate" is a paid plan (pricing on [21st.dev](https://21st.dev)). It's optional. If you don't want it, the prompt skips it and builds the components directly with `shadcn-ui` — the rest of the stack runs unchanged.

## What's in this repo

- `THE-PROMPT.md` — the master prompt. Copy this into Claude Code. This is the whole product.
- `setup.sh` — best-effort installer for the stack (the prompt runs this for you; you can also run it yourself).
- `skills/framer-motion/` — a thin, generic skill that teaches Claude the `motion` library patterns. MIT, no proprietary content.
- `LICENSE` — MIT. Covers only this repo's own files (`THE-PROMPT.md`, `setup.sh`, `skills/framer-motion`). Every third-party skill stays under its own author's licence.

## Credits

Every skill in the stack is the work of its original author, used under its own licence:

- `ui-ux-pro-max` — Next Level Builder (MIT)
- `frontend-design` — Anthropic
- `shadcn-ui` skill / shadcn/ui — shadcn and contributors (MIT)
- `impeccable`, `emil-design-eng` — open-source skills built on Anthropic's frontend-design skill and Emil Kowalski's design-engineering writing (Apache 2.0)
- `vercel-deployment`, `nextjs-app-router-expert`, `webapp-testing` — the `erichowens/skills` collection (MIT)
- `web-design-guidelines`, `web-accessibility` — open-source Claude Code skills
- `motion` (formerly Framer Motion) — Motion / Framer (MIT)
- 21st.dev Magic MCP — 21st.dev

If you're an author here and want a credit changed or your skill removed from the manifest, open an issue.
