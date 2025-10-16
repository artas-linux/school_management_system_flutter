import 'package:flutter/material.dart';
import '../models/grade.dart';
import 'school_management_drawer.dart';

class GradesListScreen extends StatelessWidget {
  const GradesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from a provider or service
    final List<Grade> grades = [
      Grade(
        id: '1',
        studentId: '1',
        courseId: '1',
        teacherId: '1',
        assignmentName: 'Algebra Quiz',
        assignmentType: 'quiz',
        pointsEarned: 24.0,
        pointsPossible: 25.0,
        feedback: 'Good work, but show your work for full credit.',
        dateAssigned: DateTime(2023, 9, 15),
        dateDue: DateTime(2023, 9, 20),
        dateGraded: DateTime(2023, 9, 22),
        category: 'quiz',
      ),
      Grade(
        id: '2',
        studentId: '1',
        courseId: '1',
        teacherId: '1',
        assignmentName: 'Geometry Test',
        assignmentType: 'exam',
        pointsEarned: 87.0,
        pointsPossible: 100.0,
        feedback: 'Solid understanding of the concepts.',
        dateAssigned: DateTime(2023, 10, 1),
        dateDue: DateTime(2023, 10, 5),
        dateGraded: DateTime(2023, 10, 7),
        category: 'test',
      ),
      Grade(
        id: '3',
        studentId: '2',
        courseId: '2',
        teacherId: '2',
        assignmentName: 'Cell Structure Lab Report',
        assignmentType: 'lab',
        pointsEarned: 92.0,
        pointsPossible: 100.0,
        feedback: 'Excellent detailed report with clear diagrams.',
        dateAssigned: DateTime(2023, 9, 20),
        dateDue: DateTime(2023, 10, 5),
        dateGraded: DateTime(2023, 10, 8),
        category: 'lab',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grades'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: ListView.builder(
        itemCount: grades.length,
        itemBuilder: (context, index) {
          final grade = grades[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(grade.assignmentName),
              subtitle: Text(
                'Course ID: ${grade.courseId} • Student ID: ${grade.studentId}\n'
                'Earned: ${grade.pointsEarned}/${grade.pointsPossible} (${grade.percentage.toStringAsFixed(1)}%) • ${grade.letterGrade}',
              ),
              trailing: Text(
                grade.letterGrade,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _getGradeColor(grade.percentage),
                ),
              ),
              onTap: () {
                // Navigate to grade detail page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new grade
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getGradeColor(double percentage) {
    if (percentage >= 90) return Colors.green;
    if (percentage >= 80) return Colors.blue;
    if (percentage >= 70) return Colors.orange;
    return Colors.red;
  }
}
