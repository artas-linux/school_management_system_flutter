# Quickstart: Zen Tools Integration

## Overview
This guide will help you set up and start using the enhanced Zen tools integration in your development workflow. The integration provides access to tools like thinkdeep and debug through CLI commands, improving precision in code analysis and debugging.

## Prerequisites
- Flutter SDK installed and configured
- Dart SDK installed and configured
- Mise installed and configured
- Git repository properly set up

## Installation

1. Ensure your development environment is properly set up:
   ```bash
   flutter doctor
   dart --version
   mise --version
   ```

2. Install the zen-tools integration by running the setup:
   ```bash
   mise run setup
   ```

3. Verify that the Zen tools are properly integrated:
   ```bash
   # Check if thinkdeep integration is available
   dart run bin/zen_tools.dart --help
   
   # Or directly through mise (to be configured)
   mise run zen-thinkdeep --help
   ```

## Basic Usage

### Using ThinkDeep for Analysis
Run deep analysis on your current codebase:
```bash
# This will be configured as a mise task
mise run zen-thinkdeep --target lib/some_file.dart
```

### Using Debug for Enhanced Debugging
Run enhanced debugging on specific issues:
```bash
# This will be configured as a mise task
mise run zen-debug --target test/some_test.dart
```

### General Tool Usage
Interact with the tool framework:
```bash
# Get help on available commands
dart run bin/zen_tools.dart --help

# Run a specific analysis
dart run bin/zen_tools.dart thinkdeep --file lib/main.dart
```

## Configuration

1. The tools are configured via the `.mise.toml` file in your project root
2. Default settings are provided, but can be customized to your needs
3. For security, all processing happens locally by default (as specified in the project constitution)

## Verification

To verify the tools are working correctly:

1. Run a simple analysis to ensure the framework is properly connected:
   ```bash
   # This will perform a basic analysis and report results
   dart run bin/zen_tools.dart thinkdeep --file lib/main.dart --dry-run
   ```

2. Check that output is generated and displayed properly
3. Verify that no external connections are made (since all processing is local)

## Next Steps

1. Integrate the tools into your regular development workflow
2. Begin using thinkdeep for architecture decisions
3. Use debug for complex issue troubleshooting
4. Monitor your development metrics to track improvement in precision and debugging time