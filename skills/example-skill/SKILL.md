# SKILL

This is the tool-agnostic core for the example skill. Keep reusable workflow
instructions here, and put tool-specific discovery metadata in adapter files
under `adapters/`.

## Name

example-skill

## Description

A reference skill that demonstrates the structure, sections, and writing style
expected of skills in this repository. Use it as a starting template when
authoring a new skill.

## When to use

- You are creating a new skill and want a known-good layout to copy.
- You want a concrete example of how the sections in `CONTRIBUTING.md` map onto
  a real `SKILL.md`.

## When not to use

- For real agent work. This skill performs no task on its own; it only
  illustrates structure.
- When an existing skill already covers your task. Improve that skill instead of
  duplicating it.

## Required workflow

1. Copy the `skills/example-skill/` directory to `skills/<your-skill-name>/`.
2. Replace the `Name` and `Description` with your skill's specifics.
3. Fill in `When to use` and `When not to use` with concrete trigger rules.
4. Write the `Required workflow` as ordered, concrete steps the agent can follow
   without guessing.
5. Update `adapters/codex/SKILL.md` and `adapters/claude/SKILL.md` with the
   loader metadata and short entrypoint text for those tools.
6. Add `Safety notes` for any destructive, external, or irreversible action.
7. Delete `references/` or `scripts/` directories if your skill does not need
   them. Keep both adapter directories.

## Safety notes

- This skill does not run commands, write files, or contact external services.
- When adapting it, mark any step that deletes data, pushes to a remote, or
  calls an external API, and require confirmation before that step runs.

## Optional examples

To scaffold a new skill from this template:

```bash
cp -r skills/example-skill skills/my-new-skill
```

See `references/optional-reference.md` for a checklist, and
`scripts/optional-helper.sh` for a small validation helper. The Codex and
Claude adapter examples live under `adapters/`.
