#!/bin/bash
# check-links.sh — Verify all [[]] references point to existing pages
# Usage: check-links.sh [wiki_path]

set -euo pipefail

WIKI_PATH="${1:-ankawiki}"

if [ ! -d "$WIKI_PATH/wiki" ]; then
  echo "Error: $WIKI_PATH/wiki not found" >&2
  exit 1
fi

echo "Checking [[]] links in $WIKI_PATH/wiki/..."
echo "---"

broken=0

# Extract all [[path|text]] and [[path]] references, get just the path part
grep -roh '\[\[[^]]*\]\]' "$WIKI_PATH/wiki/" 2>/dev/null | \
  sed 's/\[\[//;s/\]\]//' | \
  # Extract path (before | if display text exists)
  cut -d'|' -f1 | \
  sort -u | while read -r ref; do
  ref=$(echo "$ref" | xargs)
  [ -z "$ref" ] && continue
  # Check multiple possible locations
  if [ ! -f "$WIKI_PATH/wiki/$ref.md" ] && [ ! -f "$WIKI_PATH/wiki/$ref" ] && [ ! -f "$WIKI_PATH/$ref" ] && [ ! -f "$WIKI_PATH/$ref.md" ]; then
    echo "BROKEN: $ref"
  fi
done | tee /tmp/ankaclaw_broken_links.txt

broken=$(wc -l < /tmp/ankaclaw_broken_links.txt)
if [ "$broken" -eq 0 ]; then
  echo "All links valid ✅"
else
  echo ""
  echo "Found $broken broken link(s) ❌"
fi

rm -f /tmp/ankaclaw_broken_links.txt
