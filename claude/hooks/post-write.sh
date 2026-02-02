#!/bin/bash
FILE="$CLAUDE_FILE_PATH"

case "$FILE" in
    *.ts|*.tsx|*.js|*.jsx)
        command -v prettier >/dev/null 2>&1 && prettier --write "$FILE" 2>/dev/null
        ;;
    *.py)
        if command -v black >/dev/null 2>&1; then
            black "$FILE" 2>/dev/null
        elif [ -x "$HOME/tools/miniconda3/bin/black" ]; then
            "$HOME/tools/miniconda3/bin/black" "$FILE" 2>/dev/null
        fi
        ;;
    *.go)
        command -v gofmt >/dev/null 2>&1 && gofmt -w "$FILE" 2>/dev/null
        ;;
esac
