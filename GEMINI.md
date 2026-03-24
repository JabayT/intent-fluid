# Intent-Fluid Project Context

## Project Overview
**Intent-Fluid** is a curated collection of AI SKILLs designed to bridge the gap between high-level concepts and execution. Its core philosophy is "Intent Over Implementation," aiming to reduce the friction of coding by leveraging AI to handle low-level boilerplate, APIs, and configuration, thereby allowing creators to maintain a state of "Flow".

## Skill Directory Structure
Skills live under `skills/`. Each skill is a directory containing a `SKILL.md` file with YAML frontmatter (name, description, version, author, tags, platforms) followed by the skill prompt body. The AI platform scans `skills/*/SKILL.md` to discover available skills and uses the `description` field to determine when to activate each skill.

Current skills:
- `skills/surge/` — Autonomous iterative delivery (PRD → analyze → research → design → implement → QA → retro)

## Key Files & Directories
- `README.md`: Contains the project manifesto, core philosophy, and use cases.
- `/skills`: A library of structured prompts, chain-of-thought methodologies, and agent configurations. Each skill has a `SKILL.md` manifest.
- `docs/SKILL_SPEC.md`: Skill developer specification — format, naming, and validation rules.
- `docs/SKILL_TEMPLATE.md`: Quick-start template for new skill authors.
- `scripts/validate-skill.sh`: Automated compliance checker for skill directories.
- `LICENSE`: MIT License file.

## Usage
This repository serves as a skill library for AI-assisted development:
1. **Study Skills:** Read existing skills under `skills/` to understand structured prompt design.
2. **Create Skills:** Follow `docs/SKILL_SPEC.md` and `docs/SKILL_TEMPLATE.md` to author new skills.
3. **Validate:** Run `bash scripts/validate-skill.sh skills/<name>` before publishing.
