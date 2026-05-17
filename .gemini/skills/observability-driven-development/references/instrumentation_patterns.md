# Multi-Language Instrumentation Patterns

Apply these conceptual patterns to ensure your code is observable, regardless of the language or framework.

## 1. Trace/Span Pattern
Wrap core logic in a "Span" to track duration and context.

### Python (OpenTelemetry)
```python
with tracer.start_as_current_span("operation_name") as span:
    try:
        # Business logic here
        logger.info("Operation successful", extra={"user.id": user_id})
    except Exception as e:
        span.record_exception(e)
        logger.error("Operation failed", extra={"error.type": type(e).__name__})
        raise
```

### Go (OpenTelemetry)
```go
ctx, span := tracer.Start(ctx, "operation_name")
defer span.End()

if err := doWork(ctx); err != nil {
    span.RecordError(err)
    logger.Error("Operation failed", "error", err)
    return err
}
logger.Info("Operation successful")
```

### Java (Spring/OTel)
```java
Span span = tracer.spanBuilder("operation_name").startSpan();
try (Scope scope = span.makeCurrent()) {
    // Business logic
    log.info("Operation successful");
} catch (Exception e) {
    span.recordException(e);
    log.error("Operation failed", e);
    throw e;
} finally {
    span.end();
}
```

## 2. Structured Logging Pattern
Always log a static message with a dynamic attributes object.

| Language | Pattern |
| :--- | :--- |
| **Node.js (Pino)** | `logger.info({ userId: 123 }, "User login")` |
| **Python (structlog)** | `log.info("user_login", user_id=123)` |
| **Go (slog)** | `logger.Info("user_login", "user_id", 123)` |
| **Rust (tracing)** | `info!(user_id = 123, "user_login");` |

## 3. Metric Increment Pattern
Count events to build dashboards.

- **Success:** `metrics.increment("operation.success", { service: "my-service" })`
- **Failure:** `metrics.increment("operation.error", { service: "my-service", type: "timeout" })`
