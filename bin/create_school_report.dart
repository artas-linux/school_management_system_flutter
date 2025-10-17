import 'generate_report.dart';

/// Script to generate report prompts using the dart-mcp-server functionality
void main() async {
  final server = ReportGeneratorMCPServer();
  
  print('🏫 Generating School Management Report Prompts using Dart MCP Server...');
  print(String.fromCharCodes(List.filled(70, '='.codeUnitAt(0))));
  
  // Generate a student performance report prompt
  final studentPrompt = server.generateStudentPerformanceReportPrompt({
    'reportType': 'detailed',
    'timePeriod': 'academic year 2025',
    'format': 'executive summary',
  });
  
  print('\n📋 STUDENT PERFORMANCE REPORT PROMPT');
  print(String.fromCharCodes(List.filled(40, '-'.codeUnitAt(0))));
  print(studentPrompt);
  print('');
  
  // Generate a teacher report prompt
  final teacherPrompt = server.generateTeacherReportPrompt({
    'reportFocus': 'performance evaluation',
    'format': 'formal',
  });
  
  print('\n📋 TEACHER REPORT PROMPT');
  print(String.fromCharCodes(List.filled(40, '-'.codeUnitAt(0))));
  print(teacherPrompt);
  print('');
  
  // Generate a course/attendance report prompt
  final coursePrompt = server.generateCourseAttendanceReportPrompt({
    'reportType': 'attendance and grades',
    'timeRange': 'semester',
  });
  
  print('\n📋 COURSE/ATTENDANCE REPORT PROMPT');
  print(String.fromCharCodes(List.filled(40, '-'.codeUnitAt(0))));
  print(coursePrompt);
  
  print('');
  print(String.fromCharCodes(List.filled(70, '='.codeUnitAt(0))));
  print('✅ Report prompt generation completed successfully using Dart MCP Server');
  
  // Additionally, show how to generate a custom report prompt
  print('\n📝 CUSTOM REPORT PROMPT EXAMPLE:');
  print(String.fromCharCodes(List.filled(40, '-'.codeUnitAt(0))));
  final customPrompt = server.createCustomReportPrompt({
    'reportType': 'academic-performance',
    'dataPoints': ['grades', 'attendance', 'participation'],
    'format': 'executive-summary',
  });
  
  print(customPrompt);
}