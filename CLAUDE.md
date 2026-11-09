# Project rules

Built with /code2production. Plan: docs/PLAN.md · Tickets: docs/BACKLOG.md · Lessons: docs/LESSONS.md

## Settings
- Explain mode: off

## Stack
<!-- filled in during planning -->

## Commands
- Install:
- Run:
- Test (quiet, prints only failures):
- Checks (run automatically on commit): sh scripts/check.sh

## Commit messages
`T-XX feat: ...` or `T-XX fix: ...` (`docs: ...` for docs only). Never use --no-verify.

## Coding rules
- Think before coding: state assumptions; if unclear, ask instead of guessing.
- Simplicity first: minimum code that meets the ticket.
- Surgical changes: touch only what the ticket needs.
- Goal-driven: acceptance criteria → tests → make them pass.
