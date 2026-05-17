# OpenTelemetry Semantic Conventions

Use these standardized attribute names to ensure consistency across traces and metrics.

## Common Attributes
- `enduser.id`: Unique identifier of the user.
- `host.name`: Name of the host/pod.
- `deployment.environment`: `production`, `staging`, `development`.

## Database Attributes
- `db.system`: `postgresql`, `mysql`, `mongodb`, `redis`.
- `db.operation`: `find`, `insert`, `update`, `delete`.
- `db.statement`: The sanitized query (NO PII/Secrets).

## HTTP Attributes
- `http.method`: HTTP request method.
- `http.status_code`: HTTP response status code.
- `http.target`: The full request target (e.g., `/users/123`).

## Error Attributes
- `exception.type`: The exception class name.
- `exception.message`: The exception message.
- `exception.stacktrace`: The full stack trace.

## Why use conventions?
By using standardized names, observability platforms (DataDog, Honeycomb, Jaeger) can automatically generate dashboards and identify bottlenecks without manual configuration.
