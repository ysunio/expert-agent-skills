# ECS Logging Schema (Simplified)

Adhere to this schema for all structured logs to ensure cross-service correlation and high-signal observability.

## Core Mandatory Fields

| Field | Description |
| :--- | :--- |
| `@timestamp` | ISO 8601 UTC timestamp. |
| `log.level` | `DEBUG`, `INFO`, `WARN`, `ERROR`, `FATAL`. |
| `message` | **Static** summary of the event. No dynamic variables here. |
| `service.name` | Name of the service generating the log. |
| `trace.id` | W3C Trace ID for distributed tracing. |
| `span.id` | Specific ID of the operation span. |

## Contextual Objects

### `error`
Include this object for all `ERROR` and `FATAL` logs.
- `error.type`: Class/Type name of the error (e.g., `ValidationError`).
- `error.message`: The error message.
- `error.stack_trace`: Full stack trace if available.

### `http`
Include for web-related operations.
- `http.request.method`: `GET`, `POST`, etc.
- `http.response.status_code`: HTTP status code returned.
- `url.path`: The path requested.

### `user`
- `user.id`: Unique identifier of the user triggering the action.

## Implementation Rule: "Static Message, Dynamic Attributes"
**BAD:** `logger.info("User 123 checked out order 456")`
**GOOD:** `logger.info("Order checkout successful", { "user.id": "123", "order.id": "456" })`
