# Code2Production (Claude Code plugin)

You're the product owner. Claude plans with you, turns the plan into small tickets, and builds them with a lean team of subagents, each on the cheapest Claude model that fits. A QA agent reviews the work, free scripts check every commit, and a scribe keeps a project log and lessons file as your second brain.

## Install (on any computer with Claude Code and Git)

Inside Claude Code:

```
/plugin marketplace add YOUR-GITHUB-USERNAME/code2production
/plugin install code2production@c2p
```

Restart Claude Code. To get updates after you change files on GitHub: `/plugin marketplace update c2p`.

## Use

1. Make an empty project folder and run `claude` in it.
2. `/model sonnet`
3. Type `/code2` and pick **code2production** from the menu (it may show as `code2production:code2production`).
4. Describe what you want to build.
5. After each milestone: `/clear`, then run the skill again to continue in a fresh, cheaper session.

Free project history (in Git Bash on Windows): `sh scripts/c2p-log.sh`

## The team

| Role | Agent | Model | When |
|---|---|---|---|
| Planner / orchestrator (talks to you) | main session | Sonnet | always |
| Small precise tickets (batched) | dev-light | Haiku | light tickets |
| Most tickets | dev | Sonnet | standard tickets |
| Hard bugs / architecture | dev-heavy | Opus | only with your OK |
| QA review | qa | Haiku | standard/heavy tickets + once per milestone |
| Scribe (log + lessons) | scribe | Haiku | once per milestone |

## Files it creates in each project

- `docs/PLAN.md` plan · `docs/BACKLOG.md` tickets · `docs/LOG.md` what was built, fixed and decided · `docs/LESSONS.md` rules the team learned
- `scripts/check.sh` free checks on every commit (secret scan, formatter, linter, tests)
- `~/.claude/c2p/LESSONS.md` lessons shared across all your projects

## How it saves usage

- Scripts do anything scripts can do (commit checks, history from git): zero usage.
- A usage estimate per milestone before anything is built; milestones sized to one usage window.
- Haiku for small tickets (batched), QA and the scribe; Opus only with your OK.
- Agents get only their ticket, read lessons first, search before opening files, run tests quietly.
- Tiny projects (≤ 3 tickets) are built directly, without the team.

Coding rules adapted from the Karpathy-inspired guidelines (github.com/multica-ai/andrej-karpathy-skills, MIT).
