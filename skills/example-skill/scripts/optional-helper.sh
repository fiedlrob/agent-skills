#!/usr/bin/env bash
# Minimal validation helper: checks that a SKILL.md contains the required
# section headings. Read-only; it makes no changes.
#
# Usage: scripts/optional-helper.sh path/to/SKILL.md

set -euo pipefail

skill_file="${1:-}"

if [[ -z "$skill_file" ]]; then
  echo "usage: $0 path/to/SKILL.md" >&2
  exit 2
fi

if [[ ! -f "$skill_file" ]]; then
  echo "error: file not found: $skill_file" >&2
  exit 1
fi

required_sections=(
  "## Name"
  "## Description"
  "## When to use"
  "## When not to use"
  "## Required workflow"
  "## Safety notes"
)

missing=0
for section in "${required_sections[@]}"; do
  if ! grep -qxF "$section" "$skill_file"; then
    echo "missing section: $section"
    missing=1
  fi
done

if [[ "$missing" -eq 0 ]]; then
  echo "ok: all required sections present"
fi

exit "$missing"
