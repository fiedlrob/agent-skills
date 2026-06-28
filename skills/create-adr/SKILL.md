# create-adr

Tool-agnostic core for creating an Architecture Decision Record (ADR). Keep the
reusable workflow here; tool-specific discovery metadata lives in the adapter
files under `adapters/`.

## Name

create-adr

## Description

Scaffold a new Architecture Decision Record following the repository's existing
conventions: sequential zero-padded numbering, a consistent template, a valid
status, cross-links, and an updated index table when one exists. Use it when a
contributor wants to record an architectural decision.

## When to use

- The user wants to capture an architectural or design decision as an ADR.
- The repository already keeps ADRs (or wants to start) and you need a new entry
  that matches the established numbering, template, and index.

## When not to use

- For living investigation notes, scratch design docs, or meeting minutes — an
  ADR records a *closed* decision, not an evolving document.
- When the decision is reversible and trivial; not every change needs an ADR.
- To rewrite an already-accepted decision. Supersede it with a new ADR instead
  (see Safety notes).

## Required workflow

1. **Locate the ADR directory.** Detect the existing convention rather than
   assuming a path. Check, in order, for `docs/adr/`, `docs/decisions/`,
   `doc/adr/`, `adr/`. If several exist, use the one that already contains
   `NNNN-*.md` files. If none exists, ask the user where ADRs should live (and
   propose `docs/adr/` as the default) before creating anything.

2. **Determine the next number.** List the directory and take the highest
   existing four-digit `NNNN` prefix + 1, zero-padded to four digits. If the
   directory is empty, start at `0001`.
   ```bash
   ls "$adr_dir" | grep -E '^[0-9]{4}-' | sort | tail -n1
   ```

3. **Pick a short kebab-case title** → filename `NNNN-short-title.md`.

4. **Write the file** from the template below. Default status is `Proposed`.

5. **Update the index** only if the directory already has an index table (often
   in `README.md`): append a row in the same column shape the existing rows use.
   If there is no index, do not invent one unless the user asks.

6. **Cross-link.** Link related ADRs and any architecture/design doc the
   decision touches. If this ADR changes an earlier decision, mark the earlier
   one `Superseded by ADR-NNNN` and link both ways.

7. **Verify.** Re-read the new file and any edited index row to confirm the
   number, status, and column count are correct.

## Safety notes

- This skill writes a new Markdown file and may append one index row. It does not
  delete or rewrite existing decisions.
- Treat accepted ADRs as immutable: never edit the Decision/Consequences of an
  accepted ADR to reflect a new choice — create a superseding ADR instead.
- Confirm the detected ADR directory with the user before writing if the
  repository has no existing ADRs to infer the convention from.

## Optional examples

ADR template:

```markdown
# ADR-NNNN — <Title>

- **Status:** Proposed
- **Date:** <YYYY-MM-DD>

## Context

<Why this decision is needed; the constraints in play.>

## Decision

<The decision, stated plainly.>

## Consequences

**Positive:**
- <…>

**Negative / trade-offs:**
- <…>

## Alternatives considered

<Options weighed and why they were not chosen.>
```

Default status enum: `Proposed` · `Accepted` · `Superseded by ADR-NNNN` ·
`Deprecated`. If the repository already uses a different set, follow the
repository's set instead.
