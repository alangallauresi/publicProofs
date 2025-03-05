#!/bin/bash

# Ensure system updates & required packages
apt-get update && apt-get install -y curl

# Set working directory
cd /workspace/webui || exit 1

# Ensure necessary directories exist
mkdir -p /workspace/webui/pipelines

# Start Pipelines in the same process (no background mode)
( /app/pipelines & sleep 5; exec /app/open-webui )
