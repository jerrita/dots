#!/bin/bash
# PreToolUse Hook - Bash Safety Check
# Prevents dangerous commands and provides helpful reminders

set -e

TOOL_NAME="$1"
COMMAND="$2"

# Only run for Bash tool
if [[ "$TOOL_NAME" != "Bash" ]]; then
    exit 0
fi

COMMAND="$CLAUDE_CMD"

# 危险命令列表
DANGER_CMDS="rm -rf|rm -fr|:.*:.*:.*>|dd if=|mkfs.|> /dev/"

if echo "$COMMAND" | grep -qE "$DANGER_CMDS"; then
    echo "❌ BLOCKED: Dangerous command detected: $COMMAND"
    echo "Please use a safer alternative or confirm explicitly."
    exit 1
fi

exit 0