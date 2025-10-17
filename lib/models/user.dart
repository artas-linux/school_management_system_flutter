/// Model for a User in the school management system
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final UserRole role; // Student, Teacher, Parent, Admin
  final String?
  profileId; // Reference to the specific profile (studentId, teacherId, etc.)
  final DateTime createdAt;
  final DateTime? lastLogin;
  final bool isActive;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    this.profileId,
    required this.createdAt,
    this.lastLogin,
    this.isActive = true,
  });

  String get fullName => '$firstName $lastName';

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    UserRole? role,
    String? profileId,
    DateTime? createdAt,
    DateTime? lastLogin,
    bool? isActive,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      role: role ?? this.role,
      profileId: profileId ?? this.profileId,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// Enum for different user roles in the system
enum UserRole {
  student('Student'),
  teacher('Teacher'),
  parent('Parent'),
  admin('Admin');

  const UserRole(this.displayName);
  final String displayName;
}
