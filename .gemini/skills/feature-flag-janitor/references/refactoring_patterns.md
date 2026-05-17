# Universal Feature Flag Refactoring Patterns

Apply these patterns to remove feature flags in any language.

## 1. Keep the "On" Path (Feature is Launched)

### JavaScript / TypeScript
```javascript
// Before
if (flags.enabled('new-ui')) { renderNew(); } else { renderOld(); }
// After
renderNew();
```

### Python
```python
# Before
if flags.is_enabled("new-logic"):
    do_new()
else:
    do_old()
# After
do_new()
```

### Go
```go
// Before
if flags.Enabled("fast-path") {
    FastPath()
} else {
    SlowPath()
}
// After
FastPath()
```

## 2. Ternary / Inline Conditionals

### C#
```csharp
// Before
var color = flags.IsEnabled("dark-mode") ? "black" : "white";
// After
var color = "black";
```

### Python (Inline If)
```python
# Before
timeout = 5000 if flags.is_enabled("long-timeout") else 1000
# After
timeout = 5000
```

## 3. Configuration & JSON

### JSON / YAML
```yaml
# Before
features:
  new_payment_gateway: true  # <--- Delete this entry after refactoring code
```

## 4. Complexity: Logic Inversion
If removing a flag that was checked for being **OFF**:
```javascript
// Before: If flag is NOT enabled, do fallback
if (!flags.enabled('feature-x')) { doFallback(); } 

// After: Feature-x is now standard. Delete the entire block.
(empty)
```

## Cleanup Checklist (Agnostic)
- [ ] **Dependencies:** Remove the Flag SDK from `package.json`, `requirements.txt`, `go.mod`, or `csproj`.
- [ ] **Initialization:** Remove the SDK client initialization code (usually in `index.js`, `main.py`, or `Startup.cs`).
- [ ] **Environment Variables:** Delete flag-related variables from `.env`, Kubernetes ConfigMaps, or Terraform files.
- [ ] **Documentation:** Update the project README or architecture diagrams if they reference the flag.
