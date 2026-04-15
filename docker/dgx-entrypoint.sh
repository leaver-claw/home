#!/bin/sh
# Start Ollama server in background, pull models if not present, then foreground
set -e

ollama serve &
OLLAMA_PID=$!

# Wait for server to be ready
until curl -sf http://localhost:11434/api/tags > /dev/null 2>&1; do
  sleep 1
done

# Pull models only if not already present
for MODEL in \
  "qwen3-coder-next:q4_K_M" \
  "gemma4:e2b" \
  "gemma4:e4b" \
  "gemma4:latest" \
  "nemotron-3-super:120b"
do
  if ! ollama list | grep -q "$(echo "$MODEL" | cut -d: -f1)"; then
    echo "Pulling $MODEL..."
    ollama pull "$MODEL"
  fi
done

wait $OLLAMA_PID
