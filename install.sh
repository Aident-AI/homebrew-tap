#!/bin/bash
set -e # Exit on error

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ $(uname -m) == 'arm64' ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "Installing OpenCUAK on brew..."
brew update && brew install Aident-AI/homebrew-tap/open-cuak
