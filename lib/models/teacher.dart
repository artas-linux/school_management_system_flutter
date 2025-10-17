/// Model for a Teacher in the school management system
class Teacher {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? department;
  final List<String> assignedCourses; // List of course IDs the teacher teaches
  final List<String> assignedClasses; // List of class IDs the teacher handles
  final String? qualifications;
  final DateTime? hireDate;
  final String? address;
  final String? phoneNumber;
  final bool isActive;

  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.department,
    this.assignedCourses = const [],
    this.assignedClasses = const [],
    this.qualifications,
    this.hireDate,
    this.address,
    this.phoneNumber,
    this.isActive = true,
  });

  String get fullName => '$firstName $lastName';

  Teacher copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? department,
    List<String>? assignedCourses,
    List<String>? assignedClasses,
    String? qualifications,
    DateTime? hireDate,
    String? address,
    String? phoneNumber,
    bool? isActive,
  }) {
    return Teacher(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      department: department ?? this.department,
      assignedCourses: assignedCourses ?? this.assignedCourses,
      assignedClasses: assignedClasses ?? this.assignedClasses,
      qualifications: qualifications ?? this.qualifications,
      hireDate: hireDate ?? this.hireDate,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isActive: isActive ?? this.isActive,
    );
  }
}
