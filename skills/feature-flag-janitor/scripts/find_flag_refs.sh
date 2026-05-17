#!/bin/bash

# find_flag_refs.sh - Locates all occurrences of a feature flag key in the codebase

FLAG_KEY=$1

if [ -z "$FLAG_KEY" ]; then
  echo "Usage: find_flag_refs.sh <flag_key>"
  exit 1
fi

echo "### Scanning codebase for flag: '$FLAG_KEY' ..."
echo ""

# Grep for the flag key, ignoring common build/vendor directories
grep -rE "$FLAG_KEY" . \
  --exclude-dir={node_modules,dist,build,vendor,.git,.gemini} \
  --line-number \
  --color=always

echo ""
echo "---"
echo "Scan complete."
