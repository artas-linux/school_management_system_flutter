import '../models/student.dart';
import '../models/teacher.dart';
import '../models/course.dart';
import '../models/grade.dart';
import '../models/attendance.dart';
import '../models/user.dart';

/// Service class to manage all data operations for the school management system
class SchoolManagementService {
  // In-memory data stores (would be replaced with database calls in production)
  final Map<String, Student> _students = {};
  final Map<String, Teacher> _teachers = {};
  final Map<String, Course> _courses = {};
  final Map<String, Grade> _grades = {};
  final Map<String, Attendance> _attendanceRecords = {};
  final Map<String, User> _users = {};

  // Student management methods
  Future<void> addStudent(Student student) async {
    _students[student.id] = student;
  }

  Future<void> updateStudent(Student student) async {
    if (_students.containsKey(student.id)) {
      _students[student.id] = student;
    }
  }

  Future<Student?> getStudent(String id) async {
    return _students[id];
  }

  Future<List<Student>> getAllStudents() async {
    return _students.values.toList();
  }

  Future<void> deleteStudent(String id) async {
    _students.remove(id);
  }

  // Teacher management methods
  Future<void> addTeacher(Teacher teacher) async {
    _teachers[teacher.id] = teacher;
  }

  Future<void> updateTeacher(Teacher teacher) async {
    if (_teachers.containsKey(teacher.id)) {
      _teachers[teacher.id] = teacher;
    }
  }

  Future<Teacher?> getTeacher(String id) async {
    return _teachers[id];
  }

  Future<List<Teacher>> getAllTeachers() async {
    return _teachers.values.toList();
  }

  Future<void> deleteTeacher(String id) async {
    _teachers.remove(id);
  }

  // Course management methods
  Future<void> addCourse(Course course) async {
    _courses[course.id] = course;
  }

  Future<void> updateCourse(Course course) async {
    if (_courses.containsKey(course.id)) {
      _courses[course.id] = course;
    }
  }

  Future<Course?> getCourse(String id) async {
    return _courses[id];
  }

  Future<List<Course>> getAllCourses() async {
    return _courses.values.toList();
  }

  Future<void> deleteCourse(String id) async {
    _courses.remove(id);
  }

  // Grade management methods
  Future<void> addGrade(Grade grade) async {
    _grades[grade.id] = grade;
  }

  Future<void> updateGrade(Grade grade) async {
    if (_grades.containsKey(grade.id)) {
      _grades[grade.id] = grade;
    }
  }

  Future<Grade?> getGrade(String id) async {
    return _grades[id];
  }

  Future<List<Grade>> getGradesForStudent(String studentId) async {
    return _grades.values
        .where((grade) => grade.studentId == studentId)
        .toList();
  }

  Future<List<Grade>> getGradesForCourse(String courseId) async {
    return _grades.values.where((grade) => grade.courseId == courseId).toList();
  }

  Future<void> deleteGrade(String id) async {
    _grades.remove(id);
  }

  // Attendance management methods
  Future<void> addAttendance(Attendance attendance) async {
    _attendanceRecords[attendance.id] = attendance;
  }

  Future<void> updateAttendance(Attendance attendance) async {
    if (_attendanceRecords.containsKey(attendance.id)) {
      _attendanceRecords[attendance.id] = attendance;
    }
  }

  Future<Attendance?> getAttendance(String id) async {
    return _attendanceRecords[id];
  }

  Future<List<Attendance>> getAttendanceForStudent(String studentId) async {
    return _attendanceRecords.values
        .where((attendance) => attendance.studentId == studentId)
        .toList();
  }

  Future<List<Attendance>> getAttendanceForCourse(String courseId) async {
    return _attendanceRecords.values
        .where((attendance) => attendance.courseId == courseId)
        .toList();
  }

  Future<List<Attendance>> getAttendanceForDate(DateTime date) async {
    return _attendanceRecords.values
        .where(
          (attendance) =>
              attendance.date.day == date.day &&
              attendance.date.month == date.month &&
              attendance.date.year == date.year,
        )
        .toList();
  }

  Future<void> deleteAttendance(String id) async {
    _attendanceRecords.remove(id);
  }

  // User management methods
  Future<void> addUser(User user) async {
    _users[user.id] = user;
  }

  Future<void> updateUser(User user) async {
    if (_users.containsKey(user.id)) {
      _users[user.id] = user;
    }
  }

  Future<User?> getUser(String id) async {
    return _users[id];
  }

  Future<List<User>> getAllUsers() async {
    return _users.values.toList();
  }

  Future<void> deleteUser(String id) async {
    _users.remove(id);
  }

  // Get user by email (for login)
  Future<User?> getUserByEmail(String email) async {
    try {
      return _users.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      // If no user is found, return null
      return null;
    }
  }

  // Additional helper methods
  Future<List<Student>> getStudentsInCourse(String courseId) async {
    final course = await getCourse(courseId);
    if (course == null) return [];
    return _students.values
        .where((student) => course.studentIds.contains(student.id))
        .toList();
  }

  Future<List<Grade>> getStudentGradesForCourse(
    String studentId,
    String courseId,
  ) async {
    return _grades.values
        .where(
          (grade) => grade.studentId == studentId && grade.courseId == courseId,
        )
        .toList();
  }
}
