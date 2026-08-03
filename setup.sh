#!/usr/bin/env bash
# website-stack setup — best-effort installer for the five-skill website stack.
# Safe to run more than once. Nothing here is fatal: if a skill won't install,
# it prints what to do and keeps going. The master prompt (THE-PROMPT.md) will
# self-heal anything this misses.
set -u

SKILLS_DIR="${HOME}/.claude/skills"
mkdir -p "${SKILLS_DIR}"
echo "Installing the website stack into ${SKILLS_DIR}"
echo

# --- 1. framer-motion: shipped in THIS repo, fixed source -------------------
REPO_RAW_BASE="https://raw.githubusercontent.com/luke-heka/website-stack/main"
if [ ! -d "${SKILLS_DIR}/framer-motion" ]; then
  mkdir -p "${SKILLS_DIR}/framer-motion"
  if curl -fsSL "${REPO_RAW_BASE}/skills/framer-motion/SKILL.md" -o "${SKILLS_DIR}/framer-motion/SKILL.md"; then
    echo "  ok   framer-motion"
  else
    echo "  skip framer-motion (couldn't fetch; clone https://github.com/luke-heka/website-stack and copy skills/framer-motion/)"
  fi
else
  echo "  ok   framer-motion (already present)"
fi

# --- 2. the open-source skills, via the 'skills' CLI ------------------------
# Identifiers are best-effort. If 'npx skills add' isn't your install path, or
# an identifier has moved, the prompt will find the right source from each
# skill's README and clone it. Don't sweat a failure here.
if command -v npx >/dev/null 2>&1; then
  add () {
    echo "  ... ${1}"
    npx -y skills add "${2}" >/dev/null 2>&1 && echo "  ok   ${1}" || echo "  todo ${1}  (install manually — see this repo's README for the source)"
  }
  add "ui-ux-pro-max"           "nextlevelbuilder/ui-ux-pro-max-skill"
  add "vercel-deployment"       "erichowens/skills/vercel-deployment"
  add "nextjs-app-router-expert" "erichowens/skills/nextjs-app-router-expert"
  add "webapp-testing"          "erichowens/skills/webapp-testing"
  add "web-accessibility"       "erichowens/skills/web-accessibility"
  add "web-design-guidelines"   "web-design-guidelines"
  add "frontend-design"         "anthropics/skills/frontend-design"
  add "impeccable"              "impeccable"
  add "emil-design-eng"         "emil-design-eng"
  add "shadcn-ui"               "shadcn-ui"
else
  echo "  npx not found — install Node.js, then re-run, or install the skills listed in this repo's README by hand."
fi

echo
echo "Component MCP (optional): the 21st.dev Magic MCP gives you polished React"
echo "components. It needs an API key and the free tier is limited; 'Magic Generate'"
echo "is paid (see https://21st.dev). Add it to your Claude Code MCP config if you want"
echo "it. If you skip it, the build still works — shadcn-ui covers the components."
echo
echo "Done. Now paste THE-PROMPT.md into Claude Code."
