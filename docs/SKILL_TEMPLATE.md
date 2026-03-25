# Skill Template

This template follows the canonical rules in `docs/SKILL_SPEC.md`.

## Quick Start

```bash
mkdir -p skills/my-skill
bash scripts/validate-skill.sh skills/my-skill
```

Create only `skills/my-skill/SKILL.md` first. Add `references/`, `scripts/`, `assets/`, or `agents/` only when the skill truly needs them.

## Minimal `SKILL.md`

```markdown
---
name: my-skill
description: "Use when ... (trigger conditions only, <= 1024 chars)"
version: "0.1.0"
author: your-name
tags: []
platforms: [claude, cursor, gemini]
---

# my-skill

You are [role description]. Your purpose is to execute this skill with minimal context and clear operating rules.

## Gotchas

- **[Failure mode]**: [How to avoid it]

## Workflow

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Resources

- Read `references/...` only when needed.
- Run `scripts/...` only when deterministic execution is preferable.
```

## Allowed Structure

```text
skills/my-skill/
|-- SKILL.md
|-- agents/
|   `-- openai.yaml
|-- scripts/
|-- references/
`-- assets/
```

## Author Rules

- Do not add `README.md` inside the skill.
- Put prompt fragments and detailed docs in `references/`.
- Put copyable templates and output assets in `assets/`.
- Keep `description` focused on when the skill should activate.
- Keep `SKILL.md` concise and move bulky detail out of the main file.
- Validate every skill with `bash scripts/validate-skill.sh skills/<skill-name>`.
