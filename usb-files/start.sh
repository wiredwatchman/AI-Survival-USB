#!/usr/bin/env bash
# AI Survival USB: Mac and Linux starter
# Run from the USB drive folder:  ./start.sh
# Edit MODEL below if you pulled a different model.

set -u
MODEL="llama3"
DIR="$(cd "$(dirname "$0")" && pwd)"
export OLLAMA_MODELS="$DIR/ollama/models"
API="http://localhost:11434/api/version"

echo ""
echo "  ============================================================"
echo "    AI SURVIVAL USB: offline AI helper"
echo "  ============================================================"
echo ""

if [ -x "$DIR/ollama" ]; then
    OLLAMA_BIN="$DIR/ollama"
elif command -v ollama >/dev/null 2>&1; then
    OLLAMA_BIN="$(command -v ollama)"
else
    echo "  [STOP] Ollama was not found. See docs/MAC_LINUX.md."
    exit 1
fi

if [ ! -d "$OLLAMA_MODELS" ]; then
    echo "  [STOP] The model folder is missing: $OLLAMA_MODELS"
    echo "         See docs/MAC_LINUX.md, step 3."
    exit 1
fi

if curl -s "$API" >/dev/null 2>&1; then
    echo "  [STOP] Another Ollama server is already running."
    echo "         Quit the Ollama app (menu bar or system tray), then run this again."
    exit 1
fi

echo "  [1/2] Starting the AI server..."
"$OLLAMA_BIN" serve >/dev/null 2>&1 &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null' EXIT

echo "  [2/2] Waiting for the server to answer..."
for i in $(seq 1 30); do
    if curl -s "$API" >/dev/null 2>&1; then
        break
    fi
    sleep 2
done

if ! curl -s "$API" >/dev/null 2>&1; then
    echo "  [STOP] The server did not start. Restart the computer and try again."
    exit 1
fi

echo ""
echo "  READY. Type your question and press Enter. Type /bye to leave."
echo ""

"$OLLAMA_BIN" run "$MODEL"

echo ""
echo "  Done. The server is shutting down. Safe to unplug the USB."
