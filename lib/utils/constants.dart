/// Utility constants and helper functions for the school management system
class SchoolManagementConstants {
  // App name and version
  static const String appName = 'School Management System';
  static const String appVersion = '1.0.0';

  // Date formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';

  // Navigation routes
  static const String dashboardRoute = '/';
  static const String studentsRoute = '/students';
  static const String teachersRoute = '/teachers';
  static const String coursesRoute = '/courses';
  static const String gradesRoute = '/grades';
  static const String attendanceRoute = '/attendance';
  static const String settingsRoute = '/settings';

  // Storage keys
  static const String currentUserKey = 'current_user';
  static const String themeModeKey = 'theme_mode';

  // Validation patterns
  static const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phonePattern = r'^\+?[\d\s\-\(\)]+$';

  // Default values
  static const int defaultPageSize = 20;
  static const Duration apiTimeout = Duration(seconds: 30);
}

/// Helper functions for the school management system
class SchoolManagementUtils {
  /// Format a grade percentage to show 2 decimal places
  static String formatGradePercentage(double percentage) {
    return '${percentage.toStringAsFixed(2)}%';
  }

  /// Calculate letter grade from percentage
  static String getLetterGradeFromPercentage(double percentage) {
    if (percentage >= 90) return 'A';
    if (percentage >= 80) return 'B';
    if (percentage >= 70) return 'C';
    if (percentage >= 60) return 'D';
    return 'F';
  }

  /// Format currency values
  static String formatCurrency(double amount, {String currency = '\$'}) {
    return '$currency${amount.toStringAsFixed(2)}';
  }

  /// Generate a student ID based on current timestamp
  static String generateStudentId() {
    return 'STU${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Generate a teacher ID based on current timestamp
  static String generateTeacherId() {
    return 'TEACH${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Generate a course ID based on current timestamp
  static String generateCourseId() {
    return 'COURSE${DateTime.now().millisecondsSinceEpoch}';
  }
}
