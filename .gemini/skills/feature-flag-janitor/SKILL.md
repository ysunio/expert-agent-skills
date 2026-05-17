---
name: feature-flag-janitor
description: Safely automate the removal of technical debt associated with stale feature flags. Use when a feature has been 100% rolled out and the conditional logic is no longer needed.
---

# Feature Flag Janitor

Clean up the code, keep the winning path. Feature flags are temporary debt—pay it off.

## When to Use
- **Post-Launch Cleanup:** When a feature is 100% rolled out and stable.
- **Removing Failed Experiments:** When a feature experiment failed and the code must be reverted to the "Off" path.
- **Tech Debt Reduction:** Periodically scanning the codebase for "stale" flag keys.

## The Cleanup Process

### Phase 1: Impact Analysis
1.  **Find the Flag:** Run `scripts/find_flag_refs.sh <flag_key>` to locate all occurrences.
2.  **Determine the Target State:** Confirm with the user/system if the flag should be removed as **Permanently ON** (keep feature) or **Permanently OFF** (revert feature).

### Phase 2: Surgical Removal
1.  **Refactor Logic:** Apply the patterns from [refactoring_patterns.md](references/refactoring_patterns.md) to transform the code.
2.  **Simplify Expressions:** If a flag was part of a complex boolean expression, simplify the resulting logic.
3.  **Delete Dead Branches:** Remove the `else` blocks (if ON) or `if` blocks (if OFF) entirely.

### Phase 3: Secondary Cleanup
1.  **Imports:** Remove unused Flag SDK imports or configuration types.
2.  **Mocks & Tests:** Search for the flag key in `__tests__` or `test/` directories. Remove the flag from mocks and delete tests that are no longer reachable.
3.  **Config:** Remove the flag from any local configuration files (e.g., `feature-flags.json`).

### Phase 4: Validation
1.  **Build Check:** Ensure the code still compiles/builds.
2.  **Lint Check:** Run the project linter (e.g., `eslint --fix`) to clean up unused variables or formatting issues.
3.  **Verification Test:** Run the unit tests for the affected modules.

## Rationalization Rebuttals

| Agent Rationalization | Rebuttal |
| :--- | :--- |
| "The flag isn't hurting anyone; it's safer to leave it." | "Every stale flag is a cognitive tax on future developers and a potential source of 'flag hell' where behavior becomes unpredictable." |
| "I'll just do a global Find & Replace." | "Find & Replace often breaks ternary operators or nested logic. Use Phase 2 patterns for surgical accuracy." |
| "I'm not sure if the feature is 100% launched." | "Stop. Do not clean up a flag until the 'winning' state is 100% confirmed by the user or the platform dashboard." |

## Red Flags
- 🚩 **Incomplete Cleanup:** Removing the `if` check but leaving the flag import or the `else` branch in the code.
- 🚩 **Broken Logic:** Accidentally keeping the "Off" path when the intent was to keep the "On" path.
- 🚩 **Test Regressions:** Deleting tests that were actually testing the *logic* inside the branch, rather than just the flag check itself.
