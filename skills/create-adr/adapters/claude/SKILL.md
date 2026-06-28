---
name: create-adr
description: Use this skill when the user wants to record an architectural decision as an ADR — it scaffolds a numbered ADR file matching the repo's existing convention and updates the index. Not for living notes or rewriting accepted decisions.
---

# Claude Adapter

Read the tool-agnostic core instructions in `../../SKILL.md` before acting; it
holds the full workflow, template, and safety rules.

Claude-specific notes:

1. This skill should run only on an explicit request to create an ADR, not as an
   automatic reaction to unrelated edits. If you maintain skills with loader
   frontmatter, set `disable-model-invocation: true` so it is not auto-triggered.
2. Keep `name` lowercase with hyphen-separated words.
3. Keep the detailed workflow in the core `SKILL.md`; only put Claude-specific
   overrides here.
