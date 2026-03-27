# README Optimization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite README.md to showcase Intent-Fluid's value and Surge's 5 core strengths with a modern minimalist design, 4 image placeholders, and English-only content.

**Architecture:** Single-file rewrite of `README.md` plus a new `assets/images/` directory with a guide for generating the 4 required images. The README references images via relative paths. No code logic, no tests — this is a documentation task.

**Tech Stack:** Markdown, GitHub-flavored Markdown, shields.io badges

---

## File Structure

| File | Action | Purpose |
|------|--------|---------|
| `README.md` | **Rewrite** | Complete replacement with new 7-section structure |
| `assets/images/IMAGE_GUIDE.md` | **Create** | Image generation specs (dimensions, prompts, style) for 4 images |
| `assets/images/.gitkeep` | **Create** | Keep empty directory tracked in git |

---

### Task 1: Create Image Assets Directory and Guide

**Files:**
- Create: `assets/images/IMAGE_GUIDE.md`
- Create: `assets/images/.gitkeep`

- [ ] **Step 1: Create assets/images directory**

```bash
mkdir -p assets/images
```

- [ ] **Step 2: Create .gitkeep**

```bash
touch assets/images/.gitkeep
```

- [ ] **Step 3: Write IMAGE_GUIDE.md**

Create `assets/images/IMAGE_GUIDE.md` with this exact content:

```markdown
# Image Generation Guide

Generate these 4 images using Nano Banana Pro 2 (or similar AI image tool) and place them in this directory.

## 1. hero-banner.png

- **Dimensions:** 1200 x 400 px
- **Style:** Dark gradient (#0d1117 → deep navy-purple), minimalist, subtle glow, no icons
- **Content:** Centered "Intent-Fluid" in clean sans-serif + tagline "Transform Intent into Autonomous Execution" + abstract fluid/wave lines on both sides
- **Prompt:** "Minimalist dark tech banner, 1200x400, deep navy-to-purple gradient background, centered white text 'Intent-Fluid' in clean sans-serif font, subtle flowing fluid lines on both sides, faint glow effect, no icons, modern SaaS aesthetic, Vercel/Stripe style"

## 2. before-after.png

- **Dimensions:** 1200 x 600 px
- **Style:** Dark background, left/right split. Left side muted gray (pain), right side vibrant blue-purple (solution)
- **Left ("Without Surge"):** Scattered code fragments, red X marks, circular retry arrows. Bottom: "Manual iteration, context lost, quality inconsistent"
- **Right ("With Surge"):** Clean 5-step pipeline (Analyze→Research→Design→Implement→QA), green checkmark. Bottom: "Autonomous iteration, expert review, quality converged"
- **Prompt:** "Split comparison infographic, 1200x600, dark background. Left side muted gray: scattered code fragments with red X marks and circular arrows showing manual retry loops, label 'Without Surge'. Right side vibrant blue-purple: clean 5-step pipeline flowing left to right (Analyze→Research→Design→Implement→QA) with a green checkmark convergence indicator, label 'With Surge'. Minimalist flat design, no gradients on icons, clean sans-serif typography"

## 3. cognitive-pipeline.png

- **Dimensions:** 1200 x 500 px
- **Style:** Dark navy background, rounded rectangle nodes with subtle glow borders, gradient glowing connection lines
- **Content:** PRD Input → Analyze → Research → Design (Expert Panel sub-node) → Implement (Parallel Tasks sub-node) → QA. Converged → Retro → Deliverable. Unconverged → back to Analyze. Side annotation: "Process Memory" with brain icon.
- **Prompt:** "Technical flowchart diagram, 1200x500, dark navy background. Nodes as rounded rectangles with subtle glow borders: PRD Input → Analyze → Research → Design (with 'Expert Panel' sub-node) → Implement (with 'Parallel Tasks' sub-node) → QA. QA branches: 'Converged' path to Retro → Deliverable; 'Unconverged' loops back to Analyze. Side annotation 'Process Memory' with brain icon. Gradient glowing connection lines, modern tech aesthetic, clean sans-serif labels"

## 4. architecture.png

- **Dimensions:** 1200 x 450 px
- **Style:** Dark background, layered diagram, different color per layer, flat design, subtle connecting arrows
- **Content:** Three layers: Top "User Intent" (pink), Middle "Intent-Fluid Core" (blue), Bottom "Skills Library" with "surge" highlighted purple + grayed future skill slots. Right side: "Platform Adapters" bar (Claude Code, Cursor, Gemini CLI).
- **Prompt:** "Layered architecture diagram, 1200x450, dark background. Three horizontal layers: top 'User Intent' in pink, middle 'Intent-Fluid Core' in blue, bottom 'Skills Library' with 'surge' highlighted in purple glow and grayed placeholder slots for future skills. Right side vertical bar 'Platform Adapters' showing Claude Code, Cursor, Gemini CLI logos. Clean flat design, subtle connecting arrows between layers, modern tech documentation style"
```

- [ ] **Step 4: Commit**

```bash
git add assets/images/.gitkeep assets/images/IMAGE_GUIDE.md
git commit -m "docs: add image assets directory and generation guide"
```

---

### Task 2: Rewrite README.md

**Files:**
- Modify: `README.md` (complete rewrite)

- [ ] **Step 1: Write the new README.md**

Replace the entire contents of `README.md` with the following:

~~~markdown
<p align="center">
  <img src="assets/images/hero-banner.png" alt="Intent-Fluid" width="100%">
</p>

<p align="center">
  <strong>Transforming human intent into autonomous execution.</strong><br>
  Stop manual grinding, start directing intelligence.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Claude_Code_|_Cursor_|_Gemini_CLI-success?style=for-the-badge" alt="Platform Supported">
  <img src="https://img.shields.io/badge/Paradigm-Intent_Driven-ff69b4?style=for-the-badge" alt="Paradigm: Intent-Driven">
  <img src="https://img.shields.io/badge/Focus-Flow--State-blueviolet?style=for-the-badge" alt="Focus: Flow-State">
</p>

---

## ⚡ The Difference

<p align="center">
  <img src="assets/images/before-after.png" alt="Without Surge vs With Surge" width="100%">
</p>

---

## 🌊 Why Surge?

**🔄 Autonomous Iteration Engine**
Director Agent drives Analyze → Research → Design → Implement → QA in a closed loop. Not a one-shot generator — it iterates until quality converges. Auto-detects stagnation, oscillation, and Pareto frontiers to reach highest quality in minimum iterations.

**👥 Expert Review Panel**
Automatically assembles 3-5 domain experts for parallel design review. Each expert evaluates independently — security, performance, maintainability — with veto power. Multi-perspective synthesis eliminates blind spots.

**✅ Rigorous Quality Assurance**
Three-tier acceptance criteria (L1→L2→L3) with progressive escalation. Output integrity validation auto-detects truncation and recovers. Optimization directives are closed-loop tracked — every improvement proposed is verified next round.

**📋 PRD-to-Deliverable Pipeline**
One PRD in, complete deliverables out — code, documents, or strategy reports. Auto-analyzes requirement topology, negotiates acceptance criteria, orchestrates parallel subtasks. From fuzzy intent to structured output, fully autonomous.

**🧠 Self-Evolving Process Memory**
Extracts process experience after every iteration — ambiguities found, reusable components, rejected approaches, missing test cases. Persisted to memory files — gets smarter with every use. Retro phase generates rule update suggestions.

---

## 🧠 The Cognitive Pipeline

<p align="center">
  <img src="assets/images/cognitive-pipeline.png" alt="Surge Cognitive Pipeline" width="100%">
</p>

Intent-Fluid transforms intent into structured reality through an iterative, agentic pipeline. It doesn't generate once and stop — it loops through Analyze → Research → Design → Implement → QA until quality converges on your acceptance criteria. Each iteration extracts process memory, making the next run smarter.

---

## 📦 Quick Start

See the full [Installation Guide](docs/INSTALL.md) for platform-specific instructions.

```bash
git clone https://github.com/carbonshow/intent-fluid.git
```

| Platform | Integration |
|----------|-------------|
| Claude Code | `/plugin marketplace add carbonshow/intent-fluid` |
| Cursor | Add `https://github.com/carbonshow/intent-fluid` as a rule source or MCP server |
| Gemini CLI | `gemini extensions install https://github.com/carbonshow/intent-fluid` |

---

## 🏗 Architecture

<p align="center">
  <img src="assets/images/architecture.png" alt="Intent-Fluid Architecture" width="100%">
</p>

### Available Skills

| Skill | Description |
|-------|-------------|
| [surge](skills/surge/) | Autonomous delivery system — iterative analyze/research/design/implement/QA cycles driven by a Director Agent. Provide a PRD to activate. |

### Creating a New Skill

1. Read the [Skill Specification](docs/SKILL_SPEC.md)
2. Copy the [Skill Template](docs/SKILL_TEMPLATE.md)
3. Create your skill under `skills/<your-skill-name>/`
4. Validate: `bash scripts/validate-skill.sh skills/<your-skill-name>`

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center"><em>"Stay in flow. Let the intelligence follow your will."</em></p>
~~~

- [ ] **Step 2: Verify the README renders correctly**

```bash
# Check no broken relative links
head -5 README.md
# Verify image references point to existing directory
ls assets/images/
```

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "docs: rewrite README with modern minimalist design and Surge highlights"
```

---

### Task 3: Final Review and Cleanup

**Files:**
- Modify: `.gitignore` (if `.superpowers/` was added during brainstorming)

- [ ] **Step 1: Check .gitignore for brainstorming artifacts**

Verify `.superpowers/` is in `.gitignore` (added during brainstorming session). If not, add it.

```bash
grep '.superpowers/' .gitignore
```

Expected output: `.superpowers/`

- [ ] **Step 2: Verify git status is clean**

```bash
git status
```

Expected: only `.gitignore` change (if any) and no untracked files that should be committed.

- [ ] **Step 3: Commit .gitignore if changed**

```bash
git add .gitignore
git commit -m "chore: add .superpowers to gitignore"
```

- [ ] **Step 4: Review commit history**

```bash
git log --oneline -5
```

Expected: 3 new commits on `optimize-readme` branch:
1. `docs: add image assets directory and generation guide`
2. `docs: rewrite README with modern minimalist design and Surge highlights`
3. `chore: add .superpowers to gitignore` (if applicable)
