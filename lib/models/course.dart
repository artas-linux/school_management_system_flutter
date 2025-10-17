/// Model for a Course/Subject in the school management system
class Course {
  final String id;
  final String name;
  final String code;
  final String description;
  final String? department;
  final String teacherId; // Reference to the teacher teaching this course
  final List<String> studentIds; // List of enrolled student IDs
  final int credits;
  final String? syllabus; // URL or path to syllabus
  final String? prerequisites; // List of prerequisite course IDs
  final DateTime startDate;
  final DateTime endDate;
  final String? schedule; // Class schedule information

  Course({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    this.department,
    required this.teacherId,
    this.studentIds = const [],
    this.credits = 3,
    this.syllabus,
    this.prerequisites,
    required this.startDate,
    required this.endDate,
    this.schedule,
  });

  Course copyWith({
    String? id,
    String? name,
    String? code,
    String? description,
    String? department,
    String? teacherId,
    List<String>? studentIds,
    int? credits,
    String? syllabus,
    String? prerequisites,
    DateTime? startDate,
    DateTime? endDate,
    String? schedule,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      department: department ?? this.department,
      teacherId: teacherId ?? this.teacherId,
      studentIds: studentIds ?? this.studentIds,
      credits: credits ?? this.credits,
      syllabus: syllabus ?? this.syllabus,
      prerequisites: prerequisites ?? this.prerequisites,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      schedule: schedule ?? this.schedule,
    );
  }
}
