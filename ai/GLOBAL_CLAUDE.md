# Maintenance

This file lives at `~/my-configs/ai/GLOBAL_CLAUDE.md`.  
To update the global Claude instructions: edit this file, then run `source-all` — it copies this file to `~/.claude/CLAUDE.md`.

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

- AI fundamentals: LLMs, prompt engineering, RAG, AI agents, Model Context Protocol
- Workflow automation with n8n
- Competitive programming (PicoCTF, CodeWars, TypeRacer)

## Writing & Learning Style

Technical author who values clean code, architecture, and continuous skill development through books, pet projects, and competitive coding challenges.

---

# Never Do

1. **Commit or push changes** unless explicitly asked.

---

# Response Style

- Keep answers short and direct.
- No trailing summaries after completing a task.
- No unsolicited refactors — only change what was asked.

---

# Propose Me

Proactively suggest improvements when you spot an opportunity. Each proposal: one sentence naming the pattern, a concrete minimal example inline, then ask before creating any file or alias.

## 1. Automate repetitive tasks

When you notice a repeated manual action — running the same command sequence, reformatting output by hand, navigating a workflow more than twice — suggest automating it with a Zsh alias, shell function, or standalone Python/Bash CLI script. Only reach for a full CLI framework (Click, argparse) when arguments or help text are genuinely needed.
