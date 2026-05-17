---
name: chestertons-fence-archeology
description: Reconstruct the historical context and original intent of code before modifying it. Use when deleting "dead" code, refactoring legacy logic, or changing long-standing business rules to prevent regressions caused by missing tribal knowledge.
---

# Chesterton's Fence Archeology

"Do not remove a fence until you understand why it was put there in the first place."

This skill guides the agent through the process of **Code Archeology**. It ensures that every modification to existing logic is preceded by a deep investigation into its origins, constraints, and the "invisible" problems it was designed to solve.

## When to Use
- **Deleting Code:** When code appears unused but its purpose is unclear.
- **Refactoring:** When logic is complex, cryptic, or "ugly" but has been stable for a long time.
- **Changing Business Rules:** When modifying core logic that has high downstream impact.
- **Handling "Hacks":** When you encounter a workaround or "dirty" fix that seems ripe for cleanup.

## The Archaeology Process

### Phase 1: Identification & Blame
1.  **Isolate the Fence:** Identify the specific lines of code or modules you intend to change.
2.  **Run the Archeology Script:** Execute `scripts/archeology_report.sh <file> <start_line> <end_line>` to gather initial git context.
3.  **Git Blame:** Identify the author and the commit that introduced the current state.
4.  **Trace the Lineage:** If the code was part of a larger refactor, trace back to the *original* implementation using `git log -L <start>,<end>:<file>`.

### Phase 2: Context Reconstruction
1.  **Extract the "Why":** Search the git log for Issue/PR references (e.g., `#123`).
2.  **Read the PR/Issue:** (If tools allow) find the discussion surrounding the change. Look for:
    - Bug reports this code fixed.
    - Performance regressions it prevented.
    - 3rd-party API quirks it worked around.
    - Security vulnerabilities it mitigated.
3.  **Consult the References:** Use [common-fences.md](references/common-fences.md) to identify typical patterns of "invisible" constraints.

### Phase 3: Risk Assessment & Strategy
1.  **Synthesize Intent:** Write a "Historical Context" summary. What was the author trying to achieve? What were they afraid of?
2.  **Validate Assumptions:** Is the original reason still valid? (e.g., "This was a workaround for IE11, which we no longer support").
3.  **Define the Test Case:** Before changing the code, write a test that specifically reproduces the original problem the code was meant to solve. If the test passes *without* the "fence", the fence can be removed.

## Rationalization Rebuttals

| Agent Rationalization | Rebuttal |
| :--- | :--- |
| "This code is obviously redundant; modern libraries handle this." | "Was this added specifically to handle an edge case that the modern library *doesn't* cover? Verify the edge case first." |
| "The original author is gone; we can't know why they did this." | "The code and the git history *are* the author's record. Excavate the commits to find the hidden requirements." |
| "I'm just cleaning up the style; the logic stays the same." | "Refactors often introduce subtle regressions in edge cases. Prove the 'style' fix hasn't changed the semantics for null/empty inputs." |
| "It's been here for years without an update; it must be dead." | "Its stability may be a testament to its correctness. Changing it now is the highest risk action." |

## Red Flags
- 🚩 **Blame Avoidance:** Proposing a change without running `git blame`.
- 🚩 **Surface-Level Justification:** Saying "it's cleaner" without explaining why the old way was "worse" beyond aesthetics.
- 🚩 **Missing PR Context:** Failing to search for associated tickets or issues.
- 🚩 **Deleting "Magic" Constants:** Removing numbers or strings that "don't make sense" without finding their mathematical or protocol origin.

## Verification
1.  **Archeology Report:** Provide a brief summary of the commit history for the affected code.
2.  **Reproducing Test:** Run a test case that confirms the "Invisible Constraint" is still handled (or is no longer relevant).
3.  **The "Fence" Statement:** Explicitly state: "I have identified the original reason for this code ([Link/Commit]), and I am removing/changing it because [Reason]."
