import 'dart:io';
import 'package:logging/logging.dart';
import 'package:mcp_server_dart/mcp_server_dart.dart';
import 'dart:convert' show jsonEncode;
export 'package:mcp_server_dart/mcp_server_dart.dart' show MCPServer;

part 'mcp_server.mcp.dart'; // Generated file

/// An example MCP server for the school management system
class SchoolManagementMCPServer extends MCPServer {
  SchoolManagementMCPServer({bool enableLogging = true})
      : super(
          name: 'school-management-mcp-server',
          version: '1.0.0',
          description: 'MCP server for school management system',
        ) {
    // Register generated handlers
    registerGeneratedHandlers();
    
    // Set up logging only in HTTP mode, not in stdio mode
    if (enableLogging) {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
      });
    }
  }

  /// Example tool that retrieves school data
  @MCPTool(
    'getSchoolInfo',
    description: 'Retrieve information about the school',
  )
  Future<Map<String, dynamic>> getSchoolInfo() async {
    return {
      'name': 'School Management System',
      'version': '1.0.0',
      'features': [
        'Student Management',
        'Teacher Management',
        'Course Management',
        'Grade Management',
        'Attendance Tracking'
      ]
    };
  }

  /// Example tool that gets a list of students
  @MCPTool(
    'getStudents',
    description: 'Get a list of students from the school management system',
  )
  Future<List<Map<String, dynamic>>> getStudents() async {
    return [
      {
        'id': '1',
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@example.com',
        'gradeLevel': 10
      },
      {
        'id': '2',
        'firstName': 'Jane',
        'lastName': 'Smith',
        'email': 'jane.smith@example.com',
        'gradeLevel': 11
      }
    ];
  }

  /// Example tool that gets a list of teachers
  @MCPTool(
    'getTeachers',
    description: 'Get a list of teachers from the school management system',
  )
  Future<List<Map<String, dynamic>>> getTeachers() async {
    return [
      {
        'id': '1',
        'firstName': 'Robert',
        'lastName': 'Johnson',
        'email': 'robert.johnson@example.com',
        'department': 'Mathematics'
      },
      {
        'id': '2',
        'firstName': 'Emily',
        'lastName': 'Williams',
        'email': 'emily.williams@example.com',
        'department': 'Science'
      }
    ];
  }
  
  /// Example resource that provides server status
  @MCPResource(
    'status',
    description: 'Server status information',
    mimeType: 'application/json',
  )
  Future<MCPResourceContent> getStatus(String uri) async {
    final statusData = {
      'server': name,
      'version': version,
      'uptime': DateTime.now().toIso8601String(),
      'status': 'healthy',
      'capabilities': ['getSchoolInfo', 'getStudents', 'getTeachers']
    };

    return MCPResourceContent(
      uri: uri,
      name: 'status',
      title: 'Server Status',
      description: 'Status information about the school management MCP server',
      mimeType: 'application/json',
      text: jsonEncode(statusData),
      annotations: MCPResourceAnnotations(
        audience: ['user', 'assistant'],
        priority: 0.8,
        lastModified: DateTime.now().toIso8601String(),
      ),
    );
  }

  /// Example prompt template for generating reports
  @MCPPrompt(
    'generateReport',
    description: 'Generate a report template for school data',
    arguments: ['reportType', 'format'],
  )
  String generateReportPrompt(Map<String, dynamic> args) {
    final reportType = args['reportType'] ?? 'student-performance';
    final format = args['format'] ?? 'detailed';

    return '''Generate a $format $reportType report for the school management system.

**Report Type:** $reportType
**Format:** $format

Please include:
- Executive summary
- Key metrics and statistics
- Data visualizations suggestions
- Action items and recommendations
- Time period covered

Use professional educational reporting standards and include relevant data from the school management system.
''';
  }
}

void main(List<String> arguments) async {
  // Determine if we should enable logging (only in HTTP mode, not stdio)
  final enableLogging = arguments.contains('--http');
  
  // Create and start the server
  final server = SchoolManagementMCPServer(enableLogging: enableLogging);

  // Handle command line arguments
  if (arguments.contains('--help') || arguments.contains('-h')) {
    print('🏫 School Management MCP Server');
    server.showUsage(serverName: 'school_management');
    return;
  }

  if (arguments.contains('--http')) {
    final port = arguments.contains('--port')
        ? int.parse(arguments[arguments.indexOf('--port') + 1])
        : 8080;

    print('🌐 Starting HTTP server on port $port...');
    print('🔍 Health check: http://localhost:$port/health');
    print('📊 Status: http://localhost:$port/status');
    print('');

    await server.serve(port: port);
  } else {
    // When running without --http flag, this typically means stdio mode for MCP
    // Don't print anything that would interfere with MCP protocol over stdio
    await server.start();
  }
}