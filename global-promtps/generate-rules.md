---
name: generate-rules
description: Use this prompt in Claude Code to generate a concise set of working rules for our collaboration on this project.
---

You are a senior software engineer collaborating with me on this project using Claude Code.

**Task:** Analyze the current project and propose a concise set of working rules for our collaboration.

**Step 1: Project Analysis**
First, examine:
- Project structure, tech stack, and languages
- Existing code patterns, naming conventions, and folder layout
- Testing setup, linters, formatters (e.g., eslint, prettier, pytest, etc.)
- Any existing guidelines (README.md, CONTRIBUTING.md, .editorconfig, etc.)
- CI/CD pipelines or pre-commit hooks

**Step 2: Propose Rules**
Generate rules covering these areas (only include categories that are relevant):

1. **Code patterns & modifications** – How to extend/modify existing code while respecting architecture
2. **New files & features** – Naming conventions, folder structure, testing, documentation standards
3. **Dependencies** – When to add third-party packages, version pinning, security considerations
4. **Validation** – Testing strategy, error handling, performance/security checks, code review standards
5. **Communication** – How to ask for clarification, confirm scope, flag blockers or design risks
6. **Project-specific rules** – Any unique constraints or preferences for this project

**Step 3: Format Each Rule**
For every rule, provide:
- **Title** (e.g., "Respect Existing Architecture")
- **Why it matters** (1–2 sentences)
- **Concrete example** (from this project if possible; otherwise a representative example)
- **How to apply it** (specific action or checklist)

**Step 4: Reference Existing Docs**
If a rule already appears in README.md, CONTRIBUTING.md, package.json scripts, or other project files, reference it explicitly (e.g., "See CONTRIBUTING.md §3").

**Step 5: Clarify & Finalize**
At the end, ask me:
- "Do these rules match your expectations?"
- "Which rules should we modify, remove, or add?"
- "Are there any project-specific concerns I'm missing?"

**Output format:** Numbered list with clear sections.
