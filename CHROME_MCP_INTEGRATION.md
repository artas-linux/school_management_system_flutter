# Using Chrome DevTools MCP with Qwen CLI

This document explains how to integrate and use the Chrome DevTools MCP server with your Qwen CLI for the School Management System project.

## Overview

The Chrome DevTools MCP (Model-Context Protocol) server enables Qwen CLI to control and inspect a live Chrome browser. This provides powerful capabilities for browser automation, debugging, and performance analysis of your web application.

## Setup

1. The MCP server is already configured in `mcp_config.json`
2. The necessary package (`chrome-devtools-mcp`) is installed as an npm dependency
3. A start script is available at `scripts/start-chrome-mcp.sh`

## Starting the Server

You can start the Chrome DevTools MCP server using mise:

```bash
mise run chrome-mcp
```

This will start the server in headless mode on port 8081.

## Available Tools

The MCP server provides access to various Chrome DevTools capabilities through AI agents:

### Input Automation (7 tools)
- click
- drag
- fill
- fill_form
- handle_dialog
- hover
- upload_file

### Navigation Automation (7 tools)
- close_page
- list_pages
- navigate_page
- navigate_page_history
- new_page
- select_page
- wait_for

### Emulation (3 tools)
- emulate_cpu
- emulate_network
- resize_page

### Performance (3 tools)
- performance_analyze_insight
- performance_start_trace
- performance_stop_trace

### Network (2 tools)
- get_network_request
- list_network_requests

### Debugging (4 tools)
- evaluate_script
- list_console_messages
- take_screenshot
- take_snapshot

## Usage with School Management System

1. First, make sure your web application is running:
   ```bash
   flutter build web
   cd build/web && python -m http.server 8080
   ```

2. Then start the Chrome DevTools MCP server:
   ```bash
   mise run chrome-mcp
   ```

3. Now you can ask Qwen CLI to perform browser automation tasks on your school management system.

## Security Considerations

⚠️ **Important**: The Chrome DevTools MCP server exposes browser content to MCP clients, allowing them to inspect, debug, and modify data. Do not use this with sensitive information or in production environments.

## Configuration

The server uses the following default configuration:
- Headless mode enabled
- Port: 8081
- Automatic Chrome detection

For custom configurations, you can modify the `scripts/start-chrome-mcp.sh` script.