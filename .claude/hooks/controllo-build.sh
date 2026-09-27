#!/bin/bash
# Stop hook: Claude cannot declare a turn finished while the site build fails.
# Runs only in repositories that have a "build" script in package.json.
# Claude Code stops re-invoking a Stop hook after eight consecutive blocks.

INPUT=$(cat)
ACTIVE=$(printf '%s' "$INPUT" | jq -r '.stop_hook_active // false' 2>/dev/null)
if [ "$ACTIVE" = "true" ]; then exit 0; fi

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
if [ ! -f package.json ] || ! grep -q '"build"' package.json; then exit 0; fi

if ! npm run build >/tmp/claude-build.log 2>&1; then
  echo "The build fails. Fix it before finishing. Last lines:" >&2
  tail -20 /tmp/claude-build.log >&2
  exit 2
fi
exit 0
