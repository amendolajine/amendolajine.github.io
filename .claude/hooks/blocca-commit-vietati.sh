#!/bin/bash
# PreToolUse hook for "git commit": blocks the commit when the changes or the
# commit message contain a long dash or a banned word. Exit 2 = blocked, and the
# text on stderr is shown to Claude as feedback. Needs jq (brew install jq).
# Written for the macOS default bash 3.2: dashes are built from UTF-8 bytes.

INPUT=$(cat)
CMD=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')
case "$CMD" in git\ commit*|*"&& git commit"*|*"; git commit"*) ;; *) exit 0 ;; esac
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

EM=$(printf '\342\200\224')   # U+2014 em dash
EN=$(printf '\342\200\223')   # U+2013 en dash
BANNED='delve|deep dive|game-changing|seamless|robust|leverage|unlock|elevate|tapestry|testament|pivotal|crucial|in today.s|let.s dive in|here.s the thing'

EXCLUDE=(-- . ':(exclude).githooks/pre-commit' ':(exclude).claude/hooks/*' ':(exclude)docs/02_scrittura_e_fonti.md')
ADDED=$(git diff HEAD -U0 "${EXCLUDE[@]}" 2>/dev/null | grep '^+' | grep -v '^+++')
UNTRACKED=$(git ls-files --others --exclude-standard -z -- . ':(exclude).githooks/pre-commit' ':(exclude).claude/hooks/*' ':(exclude)docs/02_scrittura_e_fonti.md' 2>/dev/null | xargs -0 cat 2>/dev/null)
TEXT="$ADDED
$UNTRACKED
$CMD"

if printf '%s' "$TEXT" | grep -q -F -e "$EM" -e "$EN"; then
  echo "Blocked: a long dash is in the changes or in the commit message. Replace it with '-' and retry." >&2
  exit 2
fi
HIT=$(printf '%s' "$TEXT" | grep -o -i -E "$BANNED" | head -1)
if [ -n "$HIT" ]; then
  echo "Blocked: banned word '$HIT' found in the changes or the message. Rewrite it and retry." >&2
  exit 2
fi
exit 0
