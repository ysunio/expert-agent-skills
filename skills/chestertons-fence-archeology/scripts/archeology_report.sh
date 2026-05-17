#!/bin/bash

# archeology_report.sh - Generates a historical context report for a code range
# Part of the 'expert-agent-skills' collection by ysunio

FILE=$1
START_LINE=$2
END_LINE=$3

# 1. Validation
if [ -z "$FILE" ] || [ -z "$START_LINE" ] || [ -z "$END_LINE" ]; then
  echo "Usage: archeology_report.sh <file> <start_line> <end_line>"
  exit 1
fi

if ! [ -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: This directory is not a Git repository. Code Archeology requires Git."
  exit 1
fi

echo "### 🕵️ Code Archeology Report: $FILE (Lines $START_LINE-$END_LINE)"
echo "---"

# 2. Authorship
echo "#### 1. Current Authorship (Blame)"
git blame -L "$START_LINE","$END_LINE" -- "$FILE" 2>/dev/null || echo "Could not blame lines."
echo ""

# 3. Evolution
echo "#### 2. Evolution of this Range (Log -L)"
# This shows how these specific lines have changed over time
git log -L "$START_LINE","$END_LINE":"$FILE" --oneline --no-patch -n 5 2>/dev/null || echo "Log -L not supported for this range."
echo ""

# 4. Intent (Linked Issues/PRs)
echo "#### 3. Associated Intent (Issue/PR References)"
git log -L "$START_LINE","$END_LINE":"$FILE" 2>/dev/null | grep -oE "#[0-9]+" | sort | uniq | xargs -I {} echo "- Issue/PR: {}" || echo "No linked issues found."
echo ""

echo "---"
echo "✅ Archeology complete. Consult 'references/common-fences.md' to interpret findings."
