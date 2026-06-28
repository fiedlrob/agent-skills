# Authoring checklist

Use this checklist before opening a pull request for a new skill.

- [ ] The skill solves a clearly defined class of tasks (Specific).
- [ ] Instructions say what to do, not only what to know (Actionable).
- [ ] `When to use` and `When not to use` are both filled in (Bounded).
- [ ] Codex and Claude adapters include `name` and `description` frontmatter.
- [ ] Adapter descriptions are specific enough for each tool to trigger the
      skill correctly.
- [ ] Instructions are plain text and easy to inspect (Reviewable).
- [ ] Destructive, external, or irreversible steps have safeguards (Safe).
- [ ] No unnecessary complexity or stale assumptions remain (Maintainable).
- [ ] Markdown renders cleanly.
- [ ] Adapter, `references/`, and `scripts/` directories are removed if unused.
