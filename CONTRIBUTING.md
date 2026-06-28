# Contributing

Thanks for helping improve Agent Skills.

This repository contains reusable skills for AI coding agents. Contributions
should make agent behavior more reliable, repeatable, and reviewable.

## What Belongs Here

Good contributions include:

- New skills for recurring agent workflows
- Improvements to existing skill instructions
- Bug fixes for unclear, outdated, or unsafe guidance
- Examples, templates, or validation rules that make skills easier to use

Avoid adding:

- Project-specific instructions that cannot be reused elsewhere
- Secrets, tokens, private URLs, or internal-only information
- Vague prompts without clear trigger conditions or expected behavior
- Large generated content that is not meant to be maintained

## Skill Quality Criteria

A skill should be:

- **Specific**: It solves a clearly defined class of tasks.
- **Actionable**: It tells the agent what to do, not only what to know.
- **Bounded**: It explains when to use the skill and when not to use it.
- **Reviewable**: Instructions are plain text and easy to inspect.
- **Safe**: Risky actions, external writes, or destructive operations require
  clear safeguards.
- **Maintainable**: The skill avoids unnecessary complexity and stale
  assumptions.

## Recommended Skill Structure

Use a directory per skill:

```text
skills/
  example-skill/
    SKILL.md                 # Tool-agnostic core instructions
    adapters/
      codex/
        SKILL.md             # Codex discovery metadata and entrypoint
      claude/
        SKILL.md             # Claude discovery metadata and entrypoint
    references/
      optional-reference.md
    scripts/
      optional-helper.sh
```

The root `SKILL.md` should include the tool-agnostic core:

- Name
- Description
- When to use
- When not to use
- Required workflow
- Safety notes
- Optional examples

Adapter `SKILL.md` files should include the discovery metadata required by
their target tool. Codex and Claude adapters must start with YAML frontmatter
containing at least:

```yaml
---
name: example-skill
description: Use this skill when ...
---
```

Keep adapter descriptions specific enough for tool loaders to decide when the
skill should trigger, and keep the detailed workflow in the root `SKILL.md`.

## Writing Style

Write instructions for an AI agent that is acting in a real repository.

Prefer:

- Concrete steps
- Clear trigger rules
- Short examples
- Explicit safety boundaries

Avoid:

- Marketing language
- Ambiguous advice
- Hidden assumptions
- Instructions that depend on undocumented context

## Pull Requests

All changes must go through a pull request.

Before opening a PR:

- Check that Markdown renders cleanly.
- Keep changes focused.
- Explain why the skill or change is useful.
- Link related issues when applicable.

A PR should include:

- Summary of the change
- Motivation
- Any compatibility or safety concerns
- Notes on manual validation, if relevant

## Issues

Use issues to propose new skills, report problems, or discuss larger changes.

For a new skill proposal, include:

- The recurring task the skill should support
- Who would use it
- Example situations where it should trigger
- Any risks or limits the skill must handle

## License

By contributing, you agree that your contribution is licensed under the MIT
License.
