# Stack profiles

Read only the section that matches the project. Each lists tools for `scripts/check.sh`.

## Web app (runs in the browser)
- Vite + TypeScript (vanilla, or React only if the UI is complex). Test: Vitest (`npx vitest run --reporter=dot`).
- Format: Prettier (`npx prettier --check .`). Lint: ESLint (`npx eslint --quiet .`). Type check: `npx tsc --noEmit`.
- Deploy: GitHub Pages, Netlify or Vercel free tier.

## Python tool / script / backend
- Python 3 + pytest (`pytest -q -x --no-header`).
- Format + lint: ruff (`ruff format --check .`, `ruff check -q .`).
- Dependencies: `pip-audit` (optional, checks for known-vulnerable packages).
- Web backend if needed: FastAPI.

## Roblox game
- Code synced from files with Rojo; format with StyLua, lint with selene.
- Automated tests only work for pure logic: keep game rules in ModuleScripts with no Roblox API calls so they can be tested; everything else is checked by the user playtesting in Studio.
- So acceptance criteria are often playtest steps ("join, press E at the shop, coins drop by 10"). QA checks code and logic; the user checks gameplay at each checkpoint.
