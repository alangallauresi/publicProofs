#!/bin/bash

# Update and install necessary packages
apt-get update && apt-get install -y curl

# Create necessary directories
mkdir -p /workspace/webui/pipelines

# Start Pipelines in the background
nohup /app/pipelines &

# Start Open WebUI
/app/open-webui
