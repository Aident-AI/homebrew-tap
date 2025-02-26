#!/bin/bash
set -e # Exit on error

if [ -z "$1" ]; then
  echo "Usage: $0 <version-tag>"
  exit 1
fi

VERSION_TAG=$1
URL="https://github.com/Aident-AI/homebrew-tap/archive/${VERSION_TAG}.tar.gz"
OUTPUT_FILE=~/Downloads/homebrew-tap-${VERSION_TAG}.tar.gz

curl -L -o $OUTPUT_FILE $URL

if [ $? -ne 0 ]; then
  echo "Failed to download file from $URL"
  exit 1
fi

SHA256=$(shasum -a 256 $OUTPUT_FILE | awk '{ print $1 }')
echo "Url: $URL"
echo "SHA256: $SHA256"

# Update the open-cuak.rb file
RB_FILE="/Users/ljhskyso/repos/homebrew-tap/open-cuak.rb"
sed -i '' "s|url \".*\"|url \"$URL\"|" $RB_FILE
sed -i '' "s|sha256 \".*\"|sha256 \"$SHA256\"|" $RB_FILE

echo "Updated $RB_FILE with new URL and SHA256"
