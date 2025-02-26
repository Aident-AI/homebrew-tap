#!/bin/bash
set -e # Exit on error

if [ -z "$1" ]; then
  echo "Usage: $0 <version-tag>"
  exit 1
fi

VERSION_TAG=$1
URL="https://github.com/Aident-AI/homebrew-tap/archive/v${VERSION_TAG}.tar.gz"
OUTPUT_FILE=~/Downloads/homebrew-tap-${VERSION_TAG}.tar.gz

curl -L -o $OUTPUT_FILE $URL

if [ $? -ne 0 ]; then
  echo "Failed to download file from $URL"
  exit 1
fi
shasum -a 256 $OUTPUT_FILE
echo "Url: $URL"
