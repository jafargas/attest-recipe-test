#!/usr/bin/env bash
set -euo pipefail
a=$(sha256sum finance/close-books/ARTIFACT.md | cut -d' ' -f1)
b=$(sha256sum finance/ledger-mcp/ARTIFACT.md | cut -d' ' -f1)
l=$(printf '%s\n%s\n' "$a" "$b" | sha256sum | cut -d' ' -f1)
{
  printf '%s  %s\n' "$l" ".podium/layer"
  printf '%s  %s\n' "$a" "finance/close-books@1.5.0"
  printf '%s  %s\n' "$b" "finance/ledger-mcp@2.1.0"
} > checksums.txt
cat checksums.txt
