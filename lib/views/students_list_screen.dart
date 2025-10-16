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
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(child: Text(student.firstName[0])),
              title: Text(student.fullName),
              subtitle: Text('Grade ${student.gradeLevel} • ${student.email}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to student detail page
              },
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
