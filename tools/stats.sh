#!/bin/bash
# stats.sh — Wiki statistics
# Usage: stats.sh [wiki_path]

set -euo pipefail

WIKI_PATH="${1:-ankawiki}"

if [ ! -d "$WIKI_PATH/wiki" ]; then
  echo "Error: $WIKI_PATH/wiki not found" >&2
  exit 1
fi

echo "=== AnKaClaw Wiki Stats ==="
echo ""

# Count pages by category
for dir in entities concepts sources comparisons synthesis; do
  count=$(find "$WIKI_PATH/wiki/$dir" -name "*.md" ! -name "lint-report-*" 2>/dev/null | wc -l)
  printf "  %-15s %d pages\n" "$dir" "$count"
done

# Total
total=$(find "$WIKI_PATH/wiki" -name "*.md" ! -name "lint-report-*" 2>/dev/null | wc -l)
echo ""
echo "  Total wiki pages: $total"

# Raw sources
raw_count=$(find "$WIKI_PATH/raw" -name "*.md" 2>/dev/null | wc -l)
echo "  Raw sources: $raw_count"

# Last 5 log entries
if [ -f "$WIKI_PATH/log.md" ]; then
  echo ""
  echo "=== Recent Activity ==="
  grep "^## \[" "$WIKI_PATH/log.md" | tail -5
fi
