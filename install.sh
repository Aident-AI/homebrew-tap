#!/bin/bash
set -e # Exit on error

echo "Adding Homebrew tap..."
brew tap aident-ai "https://github.com/Aident-AI/open-cuak.git"

echo "Installing OpenCUAK..."
brew install aident-ai/open-cuak

echo "Setting up Colima..."
colima stop || true
colima start --cpu 4 --memory 8 --disk 30 --mount-type virtiofs
docker context use colima

echo "Starting OpenCUAK services..."
open-cuak start

echo "Installation complete!"
echo "Use 'open-cuak status' to check service status."
open-cuak status
