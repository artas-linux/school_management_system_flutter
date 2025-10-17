/// Model for a Grade/Assignment in the school management system
class Grade {
  final String id;
  final String studentId; // Reference to the student
  final String courseId; // Reference to the course
  final String teacherId; // Reference to the teacher who assigned the grade
  final String assignmentName;
  final String? assignmentType; // e.g., "exam", "homework", "project", "quiz"
  final double pointsEarned;
  final double pointsPossible;
  final String? feedback;
  final DateTime dateAssigned;
  final DateTime? dateDue;
  final DateTime dateGraded;
  final String? category; // e.g., "homework", "test", "participation"

  Grade({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.teacherId,
    required this.assignmentName,
    this.assignmentType,
    required this.pointsEarned,
    required this.pointsPossible,
    this.feedback,
    required this.dateAssigned,
    this.dateDue,
    required this.dateGraded,
    this.category,
  }) : assert(
         pointsEarned <= pointsPossible,
         "Points earned cannot exceed points possible",
       );

  double get percentage =>
      pointsPossible > 0 ? (pointsEarned / pointsPossible) * 100.0 : 0.0;

  String get letterGrade {
    if (percentage >= 90) return 'A';
    if (percentage >= 80) return 'B';
    if (percentage >= 70) return 'C';
    if (percentage >= 60) return 'D';
    return 'F';
  }

  Grade copyWith({
    String? id,
    String? studentId,
    String? courseId,
    String? teacherId,
    String? assignmentName,
    String? assignmentType,
    double? pointsEarned,
    double? pointsPossible,
    String? feedback,
    DateTime? dateAssigned,
    DateTime? dateDue,
    DateTime? dateGraded,
    String? category,
  }) {
    return Grade(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      teacherId: teacherId ?? this.teacherId,
      assignmentName: assignmentName ?? this.assignmentName,
      assignmentType: assignmentType ?? this.assignmentType,
      pointsEarned: pointsEarned ?? this.pointsEarned,
      pointsPossible: pointsPossible ?? this.pointsPossible,
      feedback: feedback ?? this.feedback,
      dateAssigned: dateAssigned ?? this.dateAssigned,
      dateDue: dateDue ?? this.dateDue,
      dateGraded: dateGraded ?? this.dateGraded,
      category: category ?? this.category,
    );
  }
}
