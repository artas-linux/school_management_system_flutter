import 'package:flutter/material.dart';
import '../models/course.dart';
import 'school_management_drawer.dart';

class CoursesListScreen extends StatelessWidget {
  const CoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from a provider or service
    final List<Course> courses = [
      Course(
        id: '1',
        name: 'Mathematics',
        code: 'MATH101',
        description: 'Basic algebra and geometry concepts',
        department: 'Mathematics',
        teacherId: '1',
        credits: 3,
        startDate: DateTime(2023, 9, 1),
        endDate: DateTime(2023, 12, 15),
        schedule: 'Mon, Wed, Fri 9:00AM-10:00AM',
      ),
      Course(
        id: '2',
        name: 'Biology',
        code: 'BIO101',
        description: 'Introduction to biological concepts',
        department: 'Science',
        teacherId: '2',
        credits: 4,
        startDate: DateTime(2023, 9, 1),
        endDate: DateTime(2023, 12, 15),
        schedule: 'Tue, Thu 11:00AM-12:30PM',
      ),
      Course(
        id: '3',
        name: 'English Literature',
        code: 'ENG201',
        description: 'Study of classical and modern literature',
        department: 'English',
        teacherId: '3',
        credits: 3,
        startDate: DateTime(2023, 9, 1),
        endDate: DateTime(2023, 12, 15),
        schedule: 'Mon, Wed 2:00PM-3:30PM',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    course.code.substring(course.code.length - 3),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                title: Text(
                  course.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${course.code} • ${course.credits} Credits • ${course.schedule}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(Icons.chevron_right, size: 20),
                onTap: () {
                  // Navigate to course detail page
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new course
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
