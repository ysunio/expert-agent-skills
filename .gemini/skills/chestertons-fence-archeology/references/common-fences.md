# Common "Fences" (Invisible Constraints)

When performing code archeology, look for these common patterns where code exists for a non-obvious reason.

### 1. The 3rd-Party Quirk Workaround
- **Symptom:** Code that seems to handle an impossible state or uses a redundant-looking API call.
- **Why:** A specific version of a library or browser had a bug that required this exact sequence of calls.
- **Archeology Search:** "workaround", "fix for [library name]", "issue with [browser]".

### 2. The Performance "Hot Path" Optimization
- **Symptom:** Cryptic bitwise operations, manual loops instead of high-level iterators, or object pooling.
- **Why:** This code is called millions of times per second, and the "clean" way was too slow.
- **Archeology Search:** "performance", "hot path", "optimization", "bottleneck".

### 3. The Race Condition Guard
- **Symptom:** "Pointless" timeouts, redundant state checks, or complex locking.
- **Why:** A subtle concurrency bug was found 2 years ago that only happened in production under high load.
- **Archeology Search:** "race condition", "flaky", "production issue", "timeout".

### 4. The Data Migration Legacy
- **Symptom:** Handling of deprecated fields or "weird" data formats.
- **Why:** Thousands of records in the database still use the old format, and the "Cleanup Migration" was never finished.
- **Archeology Search:** "legacy data", "migration", "backward compatibility".

### 5. The Security Mitigation
- **Symptom:** Explicit sanitization or checks that seem covered by the framework.
- **Why:** A specific vulnerability (like SSRF or XSS) was found in the framework's default behavior.
- **Archeology Search:** "CVE", "security", "sanitization", "audit".

### 6. The "Chesterton's" Default
- **Symptom:** A setting or value that seems arbitrarily chosen.
- **Why:** It was tuned over months of experimentation to balance battery life, latency, or cost.
- **Archeology Search:** "tuning", "experiment", "AB test", "default value".
