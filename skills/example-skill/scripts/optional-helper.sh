#!/usr/bin/env bash
# Minimal validation helper: checks that a skill directory contains the required
# core headings and adapter discovery metadata. Read-only; it makes no changes.
#
# Usage: scripts/optional-helper.sh path/to/skill-directory

set -euo pipefail

skill_dir="${1:-}"

if [[ -z "$skill_dir" ]]; then
  echo "usage: $0 path/to/skill-directory" >&2
  exit 2
fi

skill_file="$skill_dir/SKILL.md"

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

required_adapters=(
  "adapters/codex/SKILL.md"
  "adapters/claude/SKILL.md"
)

has_frontmatter_field() {
  local file="$1"
  local field="$2"

  awk -v field="$field" '
    BEGIN { found = 0; closed = 0 }
    NR == 1 {
      if ($0 != "---") {
        exit 1
      }
      next
    }
    $0 == "---" {
      closed = 1
      exit found ? 0 : 1
    }
    $0 ~ ("^" field ":[[:space:]]*[^[:space:]]") {
      found = 1
    }
    END {
      if (!closed) {
        exit 1
      }
    }
  ' "$file"
}

missing=0
for section in "${required_sections[@]}"; do
  if ! grep -qxF "$section" "$skill_file"; then
    echo "missing section: $section"
    missing=1
  fi
done

for adapter in "${required_adapters[@]}"; do
  adapter_file="$skill_dir/$adapter"
  if [[ ! -f "$adapter_file" ]]; then
    echo "missing adapter: $adapter"
    missing=1
    continue
  fi

  for field in name description; do
    if ! has_frontmatter_field "$adapter_file" "$field"; then
      echo "missing adapter frontmatter field: $adapter $field"
      missing=1
    fi
  done
done

if [[ "$missing" -eq 0 ]]; then
  echo "ok: all required sections and adapter metadata present"
fi

exit "$missing"
