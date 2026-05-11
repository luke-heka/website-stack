# The prompt

Copy everything inside the code block below into Claude Code, in an empty folder. Answer the three questions it asks. It does the rest.

```
You are setting up and shipping a production-grade, $10k-quality website for my business, start to finish, autonomously. Work in this order. Do not stop to ask me anything except the three questions in Step 2.

STEP 1 - INSTALL THE STACK
First, read https://github.com/lukeselr/website-stack and run its setup.sh. That installs the skills below into ~/.claude/skills and clones the framer-motion skill from that repo. If setup.sh is missing or any install fails, install each skill yourself: find its canonical GitHub source (the README in that repo names every source and licence) and clone it into ~/.claude/skills/<skill-name>, or, if you genuinely can't, apply that skill's methodology directly. Never abort because an install failed.
  1. ui-ux-pro-max - design-direction database: styles, colour palettes, font pairings, UX rules
  2. frontend-design + impeccable + emil-design-eng - aesthetic direction, polish, and the "kill the AI look" pass
  3. shadcn-ui (skill) + the 21st.dev Magic MCP - real, polished components: hero, pricing, nav, footer
  4. framer-motion - scroll fade-ins, hover micro-interactions, smooth page transitions
  5. vercel-deployment - hosting, custom domain, SSL, analytics, tracking, forms
  Also install: nextjs-app-router-expert, web-accessibility, web-design-guidelines.
  About the 21st.dev Magic MCP: it needs an API key and the free tier is limited; "Magic Generate" is a paid plan. If I don't have a key or don't want to pay, skip the MCP entirely and build the components directly with shadcn-ui. Don't block on it.

STEP 2 - ASK ME EXACTLY THREE THINGS, THEN STOP ASKING
  (a) What's the business and what's the offer? (b) What domain should it live on? (c) Light or dark?
After my three answers, make every other decision yourself and do not ask me anything else until the site is live.

STEP 3 - DESIGN DIRECTION (ui-ux-pro-max)
Run ui-ux-pro-max with --design-system for my business, industry and vibe. Lock the style, colour palette, font pairing and section order BEFORE writing any markup. Pick what fits my business, not the current trend. Then run --domain landing for the section order and CTA strategy. Persist the design system so the whole build stays consistent.

STEP 4 - BUILD THE REAL PAGE
If it's mostly copy (a landing, VSL, offer or event page): build ONE self-contained HTML file - CSS and JS inline, relative image paths, mobile-responsive, a sticky CTA bar, an FAQ accordion, scroll-reveal sections. If it needs app logic or multiple pages: scaffold a Next.js App Router project, generate the hero, pricing and nav components with the 21st.dev Magic MCP (or shadcn-ui if the MCP is skipped), and refine them with shadcn-ui. Write real headline copy, real pricing, a real FAQ. No lorem ipsum, no "Section title here" placeholders. It's real code I own forever, not a screenshot of a website.

STEP 5 - TASTE PASS (frontend-design + impeccable + emil-design-eng)
Go back over the whole page and strip the giveaway "made by AI" look: the everything-centred layout, the generic purple-to-blue gradient, the template spacing, the symmetry. Build real visual hierarchy, give the page a point of view, let it breathe, tighten the details that hold up at close range. It should read like a $10k site, not a $500 one.

STEP 6 - MOTION (framer-motion)
Add motion: sections fade in as you scroll (once, not every time they re-enter), buttons and cards react on hover, pages transition smoothly instead of jumping. Subtle, fast (150-300ms), never gimmicky. Honour prefers-reduced-motion. Animate transform and opacity only, never width/height/top/left.

STEP 7 - REVIEW
Run a Web Interface Guidelines pass and a WCAG 2.1 accessibility pass: focus order, keyboard navigation, colour contrast at least 4.5:1, alt text, labelled form fields, reduced-motion. Check the page at 375, 768, 1024 and 1440px wide. Fix everything you find. No emoji used as icons - use a proper SVG icon set.

STEP 8 - LAUNCH (vercel-deployment)
Deploy to Vercel. Connect my domain and turn SSL on. Wire in: web analytics, an analytics/ads pixel (ask me for my pixel ID, or scaffold the snippet with a clearly-marked placeholder if I don't have one yet), and a contact/lead form that posts to a webhook (ask me for the webhook URL, or scaffold it with a clearly-marked placeholder). Then give me the live URL and a preview URL.

CONSTRAINTS
No em dashes anywhere in the copy - use commas or full stops. No fake testimonials, fake stats or fake client logos. Real, on-brand, accessible, fast. If you hit something genuinely blocking, make the safest reasonable assumption, note it in one line, and keep going - finish the build.

WHEN YOU'RE DONE
Give me: the live link, the preview link, where the files/repo live, and a one-paragraph summary of what you built and which skills did what.
```
