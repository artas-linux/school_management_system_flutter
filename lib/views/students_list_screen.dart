import 'package:flutter/material.dart';
import '../models/student.dart';
import 'school_management_drawer.dart';

class StudentsListScreen extends StatelessWidget {
  const StudentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from a provider or service
    final List<Student> students = [
      Student(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        gradeLevel: 10,
        dateOfBirth: DateTime(2008, 5, 15),
        address: '123 Main St, Anytown',
        phoneNumber: '+1-555-0123',
      ),
      Student(
        id: '2',
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        gradeLevel: 9,
        dateOfBirth: DateTime(2009, 8, 22),
        address: '456 Oak Ave, Sometown',
        phoneNumber: '+1-555-0124',
      ),
      Student(
        id: '3',
        firstName: 'Mike',
        lastName: 'Johnson',
        email: 'mike.johnson@example.com',
        gradeLevel: 11,
        dateOfBirth: DateTime(2007, 12, 3),
        address: '789 Pine Rd, Othertown',
        phoneNumber: '+1-555-0125',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: ListView.builder(
        itemCount: students.length,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (context, index) {
          final student = students[index];
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
                  child: Text(
                    student.firstName[0],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                title: Text(
                  student.fullName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Grade ${student.gradeLevel} • ${student.email}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(Icons.chevron_right, size: 20),
                onTap: () {
                  // Navigate to student detail page
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new student
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
