#!/bin/sh
# Free automatic checks. Runs before every commit (via scripts/hooks/pre-commit).
# Costs zero Claude usage. Prints only problems. Exit code 1 blocks the commit.
fail=0

# 1. Secret scan (built in, no install needed): staged changes only.
if git diff --cached -U0 | grep '^+' | grep -v '^+++' | grep -En \
  'AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{30,}|AIza[0-9A-Za-z_-]{35}|-----BEGIN [A-Z ]*PRIVATE KEY-----|(api[_-]?key|secret|password|token)["'"'"' ]*[:=] *["'"'"'][^"'"'"']{8,}' >/dev/null; then
  echo "BLOCKED: something that looks like a secret (API key, password, token) is being committed. Move it to an environment variable."
  fail=1
fi
# Stronger scanner if the user has installed it (optional): https://github.com/gitleaks/gitleaks
if command -v gitleaks >/dev/null 2>&1; then
  gitleaks protect --staged --no-banner >/dev/null 2>&1 || { echo "BLOCKED: gitleaks found a secret."; fail=1; }
fi

# 2. Formatter, linter, quiet tests: filled in by ticket T-01 for this project's stack.
# Each line should print nothing when everything is fine. Examples:
#   ruff format --check . >/dev/null || { ruff format . ; echo "Formatted files; re-add them and commit again."; fail=1; }
#   ruff check -q . || fail=1
#   out=$(pytest -q -x --no-header 2>&1) || { echo "$out" | tail -15; fail=1; }
# STACK-CHECKS-START
# STACK-CHECKS-END

exit $fail
