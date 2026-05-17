/**
 * instrument_logic.cjs
 * Wraps a code block in standard ODD boilerplate.
 */

const fs = require('fs');

const codeToInstrument = process.argv[2];
if (!codeToInstrument) {
  console.error("Usage: node instrument_logic.cjs \"const x = 1;\"");
  process.exit(1);
}

const template = `
const span = tracer.startSpan('operation_name');
try {
  // --- Start Logic ---
  ${codeToInstrument.split('\n').join('\n  ')}
  // --- End Logic ---
  
  logger.info("Operation successful", { "trace.id": span.spanContext().traceId });
} catch (error) {
  logger.error("Operation failed", {
    "error.type": error.name,
    "error.message": error.message,
    "error.stack_trace": error.stack,
    "trace.id": span.spanContext().traceId
  });
  throw error;
} finally {
  span.end();
}
`;

console.log(template.trim());
