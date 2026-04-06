#!/bin/bash
# search.sh — Search wiki content by keyword
# Usage: search.sh <keyword> [wiki_path]
# Example: search.sh "RAG" /path/to/ankawiki

set -euo pipefail

KEYWORD="${1:?Usage: search.sh <keyword> [wiki_path]}"
WIKI_PATH="${2:-ankawiki}"

if [ ! -d "$WIKI_PATH/wiki" ]; then
  echo "Error: $WIKI_PATH/wiki not found" >&2
  exit 1
fi

echo "Searching for '$KEYWORD' in $WIKI_PATH/wiki/..."
echo "---"

rg --color=always --heading -n "$KEYWORD" "$WIKI_PATH/wiki/" 2>/dev/null || \
  grep -rn --color=always "$KEYWORD" "$WIKI_PATH/wiki/" || \
  echo "No results found."
