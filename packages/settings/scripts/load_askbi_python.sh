#!/bin/bash
# Ports to check and kill if in use
PORTS=(9099 9199 9299)

echo "=== Checking and killing processes on ports: ${PORTS[*]} ==="
for port in "${PORTS[@]}"; do
  # Get any PIDs listening on this port
  pids=$(lsof -t -i tcp:"$port" || true)
  if [[ -n $pids ]]; then
    echo "Port $port is in use by PID(s): $pids"
    echo "Killing PID(s): $pids"
    kill -9 $pids
    echo "✅ Killed processes on port $port"
  else
    echo "Port $port is free."
  fi
done

# /Users/kongsa/Desktop/dipeak/ask-python/tmp/load_python_service.sh
# 指定 venv 里的 Python 路径
# pyenv venv -> uv .venv
PYTHON=/Users/kongsa/Desktop/dipeak/ask-python/.venv/bin/python
PROJECT_DIR=/Users/kongsa/Desktop/dipeak/ask-python/python/nl2metric

cd $PROJECT_DIR

# Remove cached_server if it exists
if [[ -d "cached_server" ]]; then
  echo "Removing existing cached_server directory..."
  rm -rf "cached_server"
  echo "✅ cached_server directory removed."
else
  echo "No cached_server directory to remove."
fi

echo "Starting main_embedding_service.py..."
nohup $PYTHON main_embedding_service.py > embedding.log 2>&1 &
sleep 1

echo "Starting main_shared_service.py..."
nohup $PYTHON main_shared_service.py > shared.log 2>&1 &
sleep 1

echo "Starting main.py..."
$PYTHON main.py
