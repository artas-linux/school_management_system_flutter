#!/bin/bash

# Script to start Chrome DevTools MCP server for the School Management System
# This enables Qwen CLI to interact with Chrome DevTools for browser automation and debugging

echo "🚀 Starting Chrome DevTools MCP server for School Management System..."

# Start the Chrome DevTools MCP server with headless mode using stable channel
npx chrome-devtools-mcp --headless --channel stable --port 8081

echo "✅ Chrome DevTools MCP server running on port 8081"