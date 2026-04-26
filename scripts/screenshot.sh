#!/usr/bin/env bash

set -e

if ! command -v node &>/dev/null; then
  echo "Node.js is required but not installed. Install it from https://nodejs.org"
  exit 1
fi

if ! npx --yes playwright --version &>/dev/null 2>&1; then
  echo "Installing Playwright..."
  npm install -g playwright
fi

if [ ! -d "$HOME/.cache/ms-playwright/chromium"* ] 2>/dev/null; then
  echo "Installing Chromium browser..."
  npx playwright install chromium
fi

read -rp "Enter URL to screenshot: " url

if [[ -z "$url" ]]; then
  echo "No URL provided."
  exit 1
fi

read -rp "Full-page screenshot? [y/N]: " fullpage

timestamp=$(date +"%Y%m%d_%H%M%S")
output="screenshot_${timestamp}.png"

if [[ "$fullpage" =~ ^[Yy]$ ]]; then
  npx playwright screenshot --full-page "$url" "$output"
else
  npx playwright screenshot "$url" "$output"
fi

echo "Saved: $output"
