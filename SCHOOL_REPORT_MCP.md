# School Management System Report Prompts with Dart MCP Server

This project demonstrates how to use the dart-mcp-server to generate report prompts for the school management system. The MCP server creates structured prompts that can be used by AI assistants to generate detailed reports.

## Available Report Prompts

The system provides various types of report prompts:

- **Student Performance Reports**: Prompts for creating student performance analysis
- **Teacher Reports**: Prompts for generating teacher evaluation reports
- **Course/Attendance Reports**: Prompts for attendance and grade analysis
- **Custom Reports**: Flexible prompts for various report types

## Usage

### Generate Report Prompts

```bash
dart run bin/create_school_report.dart
```

This will generate various report prompts using the MCP server functionality.

### Using the MCP Server

The system also provides an MCP server that can be used by AI assistants:

```bash
# Run in stdio mode for MCP protocol
dart run bin/generate_report.dart

# Or run in HTTP mode
dart run bin/generate_report.dart --http --port 8080
```

## Features

- **MCP Prompt**: `generateStudentPerformanceReportPrompt` - Creates prompts for student performance reports
- **MCP Prompt**: `generateTeacherReportPrompt` - Creates prompts for teacher reports
- **MCP Prompt**: `generateCourseAttendanceReportPrompt` - Creates prompts for course and attendance reports
- **MCP Prompt**: `createCustomReportPrompt` - Creates flexible custom report prompts
- Parameter support for different report types, time ranges, and formats

## Prompt Parameters

The MCP prompts accept various parameters to customize the generated prompts:

- `reportType`: Type of report to focus on (summary, detailed, performance, evaluation)
- `timePeriod`/`timeRange`: Time period for the report (monthly, semester, annual)
- `format`: Format of the report (executive summary, formal, detailed)
- `dataPoints`: Specific data points to include in custom reports

## Example Output

The system generates structured prompts that guide AI assistants in creating comprehensive reports with:
- Executive summaries
- Key performance metrics
- Data analysis
- Visual representation suggestions
- Actionable recommendations