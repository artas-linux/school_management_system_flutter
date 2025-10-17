import 'dart:convert';
import 'package:mcp_server_dart/mcp_server_dart.dart';
import 'mcp_server.dart';

/// Report Prompt Generator Server that extends the School Management MCP Server
/// This server specifically generates prompts for report creation by AI tools
class ReportGeneratorMCPServer extends SchoolManagementMCPServer {
  ReportGeneratorMCPServer() : super();

  /// Generate a prompt for creating a student performance report
  @MCPPrompt(
    'generateStudentPerformanceReportPrompt',
    description: 'Generate a prompt for creating a comprehensive student performance report',
    arguments: ['reportType', 'timePeriod', 'format'],
  )
  String generateStudentPerformanceReportPrompt(Map<String, dynamic> args) {
    final reportType = args['reportType'] ?? 'summary';
    final timePeriod = args['timePeriod'] ?? 'current semester';
    final format = args['format'] ?? 'detailed';
    
    return '''
Create a $format $reportType student performance report for a school management system for the $timePeriod.

The report should include:
- Executive summary with key metrics
- Student performance statistics
- Grade distribution analysis
- Teacher assignment overview
- Attendance patterns if available
- Recommendations for improvement
- Data visualizations suggestions

Use professional educational reporting standards and provide actionable insights.
''';
  }

  /// Generate a prompt for creating a teacher performance report
  @MCPPrompt(
    'generateTeacherReportPrompt',
    description: 'Generate a prompt for creating a teacher report',
    arguments: ['reportFocus', 'format'],
  )
  String generateTeacherReportPrompt(Map<String, dynamic> args) {
    final reportFocus = args['reportFocus'] ?? 'performance';
    final format = args['format'] ?? 'standard';
    
    return '''
Create a $format teacher $reportFocus report for the school management system.

Include:
- Teacher workload analysis
- Student performance correlation
- Subject area distribution
- Performance metrics
- Professional development recommendations
- Department-wise analysis

Structure the report with clear sections and actionable insights.
''';
  }

  /// Generate a prompt for creating a course/attendance report
  @MCPPrompt(
    'generateCourseAttendanceReportPrompt',
    description: 'Generate a prompt for creating a course and attendance report',
    arguments: ['reportType', 'timeRange'],
  )
  String generateCourseAttendanceReportPrompt(Map<String, dynamic> args) {
    final reportType = args['reportType'] ?? 'attendance';
    final timeRange = args['timeRange'] ?? 'monthly';
    
    return '''
Create a $reportType report for the school management system covering the $timeRange period.

Include:
- Course enrollment statistics
- Attendance patterns and trends
- Grade distributions by course
- Teacher assignments per course
- Student attendance analysis
- Recommendations for improvement

Format with clear sections and visual representation suggestions.
''';
  }

  /// Generate a customizable report prompt
  @MCPPrompt(
    'createCustomReportPrompt',
    description: 'Create a prompt for generating custom reports',
    arguments: ['reportType', 'dataPoints', 'format'],
  )
  String createCustomReportPrompt(Map<String, dynamic> args) {
    final reportType = args['reportType'] ?? 'performance';
    final dataPoints = args['dataPoints'] ?? ['students', 'grades'];
    final format = args['format'] ?? 'detailed';
    
    return '''
Create a $format $reportType report for the school management system.

Data points to include: ${dataPoints.join(', ')}

Report should contain:
- Executive summary with key metrics
- Detailed analysis of the provided data points
- Recommendations based on the data
- Visual representation suggestions
- Comparison with previous periods if available

Format the response in a structured way with clear sections that can be used for administrative reporting.
''';
  }
}

void main(List<String> arguments) async {
  final server = ReportGeneratorMCPServer();
  
  // Handle command line arguments
  if (arguments.contains('--help') || arguments.contains('-h')) {
    print('📊 Report Generator MCP Server');
    print('Available tools: generateStudentPerformanceReport');
    print('Available prompts: createCustomReportPrompt');
    print('');
    print('Usage: dart generate_report.dart [options]');
    print('  --stdio        Start server in stdio mode (default)');
    print('  --http         Start HTTP server on port 8080');
    print('  --port <port>  Specify HTTP port (default: 8080)');
    print('  --help, -h     Show this help message');
    print('');
    print('Examples:');
    print('  dart generate_report.dart');
    print('  dart generate_report.dart --http');
    print('  dart generate_report.dart --http --port 3000');
    return;
  }

  if (arguments.contains('--http')) {
    final port = arguments.contains('--port')
        ? int.parse(arguments[arguments.indexOf('--port') + 1])
        : 8080;

    print('🌐 Starting Report Generator HTTP server on port $port...');
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