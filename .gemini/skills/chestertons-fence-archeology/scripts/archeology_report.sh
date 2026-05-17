#!/bin/bash

# archeology_report.sh - Generates a historical context report for a code range

FILE=$1
START_LINE=$2
END_LINE=$3

if [ -z "$FILE" ] || [ -z "$START_LINE" ] || [ -z "$END_LINE" ]; then
  echo "Usage: archeology_report.sh <file> <start_line> <end_line>"
  exit 1
fi

echo "### Code Archeology Report for $FILE ($START_LINE-$END_LINE)"
echo ""

echo "#### 1. Git Blame (Current Authorship)"
git blame -L "$START_LINE","$END_LINE" "$FILE"
echo ""

echo "#### 2. Commit History (Last 5 changes to this range)"
git log -L "$START_LINE","$END_LINE":"$FILE" --oneline -n 5
echo ""

echo "#### 3. Potential Issue/PR Links"
git log -L "$START_LINE","$END_LINE":"$FILE" | grep -oE "#[0-9]+" | sort | uniq
echo ""

echo "#### 4. Summary of Changes"
git log -L "$START_LINE","$END_LINE":"$FILE" --pretty=format:"%h - %an, %ar : %s" -n 5
echo ""
