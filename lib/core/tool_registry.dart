import 'zen_integration.dart';

/// Tool registry to manage available Zen tools
class ToolRegistry {
  static final Map<String, ZenTool> _tools = {};

  /// Initialize the registry with default tools
  static void initializeDefaultTools() {
    _tools['thinkdeep'] = ZenTool(
      toolName: 'thinkdeep',
      toolType: 'analysis',
      cliCommand: 'scripts/zen-tools/thinkdeep_wrapper.sh',
      supportedFeatures: [
        'deep-analysis',
        'architecture-review',
        'code-quality',
      ],
      isActive: true,
    );

    _tools['debug'] = ZenTool(
      toolName: 'debug',
      toolType: 'debugging',
      cliCommand: 'scripts/zen-tools/debug_wrapper.sh',
      supportedFeatures: [
        'error-detection',
        'performance-analysis',
        'memory-usage',
      ],
      isActive: true,
    );
  }

  /// Register a new tool
  static void registerTool(ZenTool tool) {
    _tools[tool.toolName] = tool;
  }

  /// Get a tool by name
  static ZenTool? getTool(String name) {
    return _tools[name];
  }

  /// Get all registered tools
  static Map<String, ZenTool> getAllTools() {
    return Map.from(_tools);
  }

  /// Check if a tool is active
  static bool isToolActive(String name) {
    final tool = _tools[name];
    return tool != null && tool.isActive;
  }
}
