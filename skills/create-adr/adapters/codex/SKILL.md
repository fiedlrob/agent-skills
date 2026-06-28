---
name: create-adr
description: Use this skill when the user wants to record an architectural decision as an ADR — it scaffolds a numbered ADR file matching the repo's existing convention and updates the index. Not for living notes or rewriting accepted decisions.
---

# Codex Adapter

Read the tool-agnostic core instructions in `../../SKILL.md` before acting; it
holds the full workflow, template, and safety rules.

Codex-specific notes:

1. Codex has no separate review/subagent step — run the full workflow inline in
   the main task: detect the ADR directory, compute the next number, write the
   file, and update the index in the same pass.
2. Keep `name` lowercase with hyphen-separated words.
3. Keep the detailed workflow in the core `SKILL.md`; only put Codex-specific
   overrides here.
