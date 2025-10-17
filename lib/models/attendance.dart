/// Model for Attendance in the school management system
class Attendance {
  final String id;
  final String studentId; // Reference to the student
  final String courseId; // Reference to the course/subject
  final DateTime date;
  final AttendanceStatus status; // Present, Absent, Late, Excused
  final String? notes; // Additional notes about attendance
  final String?
  teacherId; // Reference to the teacher who recorded the attendance

  Attendance({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.date,
    required this.status,
    this.notes,
    this.teacherId,
  });

  Attendance copyWith({
    String? id,
    String? studentId,
    String? courseId,
    DateTime? date,
    AttendanceStatus? status,
    String? notes,
    String? teacherId,
  }) {
    return Attendance(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      date: date ?? this.date,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      teacherId: teacherId ?? this.teacherId,
    );
  }
}

/// Enum for different attendance statuses
enum AttendanceStatus {
  present('Present'),
  absent('Absent'),
  late('Late'),
  excused('Excused');

  const AttendanceStatus(this.displayName);
  final String displayName;
}
