#!/bin/bash

# Ensure system updates & required packages
apt-get update && apt-get install -y curl

# Set working directory
cd /workspace/webui || exit 1

# Ensure necessary directories exist
mkdir -p /workspace/webui/pipelines

# Start Pipelines properly & wait for it to initialize
nohup /app/pipelines > /workspace/webui/pipelines.log 2>&1 &

# Give Pipelines time to start before launching WebUI
sleep 5

# Start Open WebUI in foreground (so Vast.ai doesn't kill the process)
exec /app/open-webui
