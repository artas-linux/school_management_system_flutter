import 'generate_report.dart';

/// Test script to generate report prompts using the MCP server functionality
void main() async {
  final server = ReportGeneratorMCPServer();
  
  print('📊 Generating Report Prompts using Dart MCP Server...');
  print('');
  
  // Generate a student performance report prompt
  final studentPrompt = server.generateStudentPerformanceReportPrompt({
    'reportType': 'detailed',
    'timePeriod': 'first quarter 2024',
    'format': 'executive summary',
  });
  
  print('Student Performance Report Prompt:');
  print(studentPrompt);
  print('');
  
  // Generate a teacher report prompt
  final teacherPrompt = server.generateTeacherReportPrompt({
    'reportFocus': 'performance evaluation',
    'format': 'formal',
  });
  
  print('Teacher Report Prompt:');
  print(teacherPrompt);
  print('');
  
  // Generate a course/attendance report prompt
  final coursePrompt = server.generateCourseAttendanceReportPrompt({
    'reportType': 'attendance and grades',
    'timeRange': 'semester',
  });
  
  print('Course/Attendance Report Prompt:');
  print(coursePrompt);
  print('');
  
  // Create a custom report prompt
  final customPrompt = server.createCustomReportPrompt({
    'reportType': 'attendance',
    'dataPoints': ['attendance', 'tardiness', 'absences'],
    'format': 'executive',
  });
  
  print('Custom Report Prompt:');
  print(customPrompt);
}