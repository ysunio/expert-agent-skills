# Agent Development Skills 🛠️🛡️📊

**Enhancing AI agents with robust engineering practices for production.**

[![Language Agnostic](https://img.shields.io/badge/Language-Agnostic-blue.svg)](#)
[![Standard](https://img.shields.io/badge/Standard-OpenTelemetry%20%7C%20ECS-orange.svg)](#)

This repository provides a collection of **Agent Development Skills** designed to instill robust engineering discipline into AI coding agents, suitable for production environments.

---

## Why Advanced Agent Skills?

Most AI agent skills focus on *writing code faster*. These skills focus on **writing code better** by addressing the three most common failures of AI agents:

1.  **The "Blind Refactor" Failure:** Deleting critical legacy logic because it looks "ugly."
    *   *Solution:* [Chesterton's Fence Archeology](skills/chestertons-fence-archeology/SKILL.md)
2.  **The "Black Box" Failure:** Writing features that work but are impossible to debug in production.
    *   *Solution:* [Observability-Driven Development](skills/observability-driven-development/SKILL.md)
3.  **The "Flag Hell" Failure:** Leaving stale feature flags that create permanent technical debt.
    *   *Solution:* [Feature Flag Janitor](skills/feature-flag-janitor/SKILL.md)

---

## 📦 Installation

You can install the entire collection or pick specific skills as needed.

### Install All Skills (Gemini CLI)
```bash
gemini skills install https://github.com/ysunio/expert-agent-skills --path skills
```

### Install Specific Skills
To avoid cluttering your agent, you can install only the workflows you need:

| Skill | Installation Command |
| :--- | :--- |
| **Meta-Skill** | `gemini skills install https://github.com/ysunio/expert-agent-skills --path skills/expert-agent-skills` |
| **Archeology** | `gemini skills install https://github.com/ysunio/expert-agent-skills --path skills/chestertons-fence-archeology` |
| **Observability** | `gemini skills install https://github.com/ysunio/expert-agent-skills --path skills/observability-driven-development` |
| **Janitor** | `gemini skills install https://github.com/ysunio/expert-agent-skills --path skills/feature-flag-janitor` |

---

## 🤖 For Agents

This repository follows the [agent-skills](https://github.com/addyosmani/agent-skills) standard. 

- **Persona Definitions:** See [AGENTS.md](AGENTS.md) for how your agent should behave.
- **Discovery:** Use the `expert-agent-skills` meta-skill to automatically map tasks to these workflows.
- **Slash Commands:** Once installed, you can use:
  - `/archeology`
  - `/odd`
  - `/janitor`

---

## 🌍 Language Agnostic & Reusable

These skills are designed to be **completely language and framework agnostic**. Whether you are working in **Go, Python, TypeScript, Java, or Rust**, the patterns and tools provided will work out-of-the-box.

