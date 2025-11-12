#!/bin/bash
# Replace placeholder in built Next.js output with actual environment variable
set -e

PLACEHOLDER="__NEXT_PUBLIC_API_BASE_URL__"
TARGET_DIR="release"

if [ -z "$NEXT_PUBLIC_API_BASE_URL" ]; then
  echo "❌ NEXT_PUBLIC_API_BASE_URL not set"
  exit 1
fi

echo "🔧 Replacing API base URL placeholders..."
grep -rl "$PLACEHOLDER" "$TARGET_DIR" | xargs sed -i "s|$PLACEHOLDER|$NEXT_PUBLIC_API_BASE_URL|g"
echo "✅ Replacement complete."
