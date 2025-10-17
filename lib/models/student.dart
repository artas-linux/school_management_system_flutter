/// Model for a Student in the school management system
class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int gradeLevel;
  final String? parentId; // Reference to parent/guardian
  final String? teacherId; // Reference to assigned teacher
  final List<String> enrolledCourses; // List of course IDs
  final DateTime dateOfBirth;
  final String? address;
  final String? phoneNumber;
  final bool isActive;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gradeLevel,
    this.parentId,
    this.teacherId,
    this.enrolledCourses = const [],
    required this.dateOfBirth,
    this.address,
    this.phoneNumber,
    this.isActive = true,
  });

  String get fullName => '$firstName $lastName';

  Student copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    int? gradeLevel,
    String? parentId,
    String? teacherId,
    List<String>? enrolledCourses,
    DateTime? dateOfBirth,
    String? address,
    String? phoneNumber,
    bool? isActive,
  }) {
    return Student(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gradeLevel: gradeLevel ?? this.gradeLevel,
      parentId: parentId ?? this.parentId,
      teacherId: teacherId ?? this.teacherId,
      enrolledCourses: enrolledCourses ?? this.enrolledCourses,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isActive: isActive ?? this.isActive,
    );
  }
}
