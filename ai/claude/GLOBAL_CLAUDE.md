# Table of Contents

- [Maintenance](#maintenance)
- [About the User](#about-the-user)
- [Always Do](#always-do)
- [Never Do](#never-do)
- [Response Style](#response-style)
- [Propose Me](#propose-me)

---

# Maintenance

This file lives at `~/my-configs/ai/claude/GLOBAL_CLAUDE.md`.  
To update the global Claude instructions: edit this file, then run `source-all` — it copies this file to `~/.claude/CLAUDE.md`.  
To add a skill: create `~/my-configs/ai/claude/skills/<name>/SKILL.md`, then run `source-all` — it merges skills into `~/.claude/skills/` without removing existing ones.

---

# About the User

**Name:** Oleh Baranovskyi  
**Role:** Software Craftsman and Technical Author  
**Experience:** 10+ years of programming

## Technical Background

**Primary languages:** Python, JavaScript/TypeScript, C#/.NET, Bash, Node.js  
**Frontend:** HTML, CSS/SASS, Angular, React  
**Additional:** Java, Groovy, SQL, Lua

**Focus areas:** coding tips & tricks, functional & OOP, design principles, patterns, and refactoring

## Development Environment

- **Editor:** Neovim (Lua config)
- **Terminal:** Kitty
- **Shell:** Zsh + Oh My Zsh
- **Multiplexer:** Tmux
- **Window management:** Amethyst
- **File managers:** Ranger, Vifm

## Current Interests

- AI: LLMs, prompt engineering, RAG, AI agents, Model Context Protocol
- Software Architecture: design principles, patterns, refactoring, ADRs
- System Design: distributed systems, scalability, service boundaries

## Writing & Learning Style

Technical author who values clean code, architecture, and continuous skill development through books, pet projects, and competitive coding challenges.

---

# Always Do

1. **Place CLI scripts inside the relevant skill's `scripts/` folder** (`ai/claude/skills/<skill-name>/scripts/`), not in `python/`.
2. **Generate unique content and examples** — never copy or reproduce content from existing sources to avoid copyright issues.

---

# Never Do

1. **Commit or push changes** unless explicitly asked.

---

# Response Style

- Keep answers short and direct.

---

# Propose Me

Proactively suggest improvements when you spot an opportunity. Each proposal: one sentence naming the pattern, a concrete minimal example inline, then ask before creating any file or alias.

## 1. Automate repetitive tasks

When you notice a repeated manual action — running the same command sequence, reformatting output by hand, navigating a workflow more than twice — suggest automating it with a Zsh alias, shell function, or standalone Python/Bash CLI script. Only reach for a full CLI framework (Click, argparse) when arguments or help text are genuinely needed.
