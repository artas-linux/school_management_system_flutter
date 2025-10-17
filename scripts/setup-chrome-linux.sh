#!/bin/bash

# Script to set up Google Chrome for Linux in the School Management System project
# This ensures Chrome is available for development and testing

echo "🔧 Setting up Google Chrome for Linux..."

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "⚠️  This script is designed for Linux systems only"
    exit 1
fi

# Check if google-chrome-stable is installed
if command -v google-chrome-stable &> /dev/null; then
    echo "✅ Google Chrome is already installed"
    CHROME_VERSION=$(google-chrome-stable --version)
    echo "📊 Chrome version: $CHROME_VERSION"
else
    echo "📦 Installing Google Chrome..."

    # Download and install Google Chrome
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable

    if command -v google-chrome-stable &> /dev/null; then
        echo "✅ Google Chrome installed successfully"
    else
        echo "❌ Failed to install Google Chrome"
        exit 1
    fi
fi

# Check if chrome-devtools-mcp is properly installed via npm
if node -e "require('chrome-devtools-mcp')" &> /dev/null; then
    echo "✅ Chrome DevTools MCP package is available"
else
    echo "📦 Installing chrome-devtools-mcp via npm..."
    npm install chrome-devtools-mcp
    echo "✅ Chrome DevTools MCP package installed"
fi

echo "✅ Google Chrome setup completed for Linux"
echo ""
echo "📌 You can now use the 'mise run dev-web-five' command to launch the app with Chrome."