---
name: expert-agent-skills
description: Discovers and invokes expert engineering skills. Use when you need to decide which high-rigor workflow applies to the current task.
---

# Expert Agent Skills (Meta-Skill)

This is the primary discovery mechanism for the **Expert Agent Skills** collection. It helps you apply senior-level engineering rigor to common development tasks.

## Overview
Unlike basic task automation, these skills focus on **Engineering Integrity**. They ensure that you don't break legacy logic, that you build observable systems, and that you proactively manage technical debt.

## Skill Discovery
When a task arrives, identify the risk profile and apply the corresponding expert skill:

*   **Risk: Breaking legacy logic or "hidden" constraints?**
    → `chestertons-fence-archeology`
    *Use when:* Deleting code, refactoring complex modules, or changing long-standing business rules.

*   **Risk: Building "black box" features that are hard to debug?**
    → `observability-driven-development`
    *Use when:* Implementing new logic, refactoring core paths, or adding external integrations.

*   **Risk: Accumulating technical debt from experiments?**
    → `feature-flag-janitor`
    *Use when:* A feature has finished rolling out or an experiment has concluded.

## Core Operating Behaviors
These behaviors apply across all expert skills:

1.  **Investigate Before You Edit:** Do not touch code you don't understand.
2.  **Instrument Before You Ship:** If it's not observable, it's not production-ready.
3.  **Leave No Trace:** Clean up your feature flags and temporary scaffolding.
4.  **Verify via Evidence:** Don't just say it works; provide the logs, tests, or archeology reports to prove it.

## Installation
To install a specific expert skill:
```bash
gemini skills install <repo-url> --path skills/<skill-name>
```
