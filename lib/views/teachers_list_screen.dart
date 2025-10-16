import 'package:flutter/material.dart';
import '../models/teacher.dart';
import 'school_management_drawer.dart';

class TeachersListScreen extends StatelessWidget {
  const TeachersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from a provider or service
    final List<Teacher> teachers = [
      Teacher(
        id: '1',
        firstName: 'Robert',
        lastName: 'Williams',
        email: 'robert.williams@school.edu',
        department: 'Mathematics',
        qualifications: 'PhD in Mathematics',
        hireDate: DateTime(2015, 8, 15),
        phoneNumber: '+1-555-0201',
      ),
      Teacher(
        id: '2',
        firstName: 'Emily',
        lastName: 'Davis',
        email: 'emily.davis@school.edu',
        department: 'Science',
        qualifications: 'MSc in Biology',
        hireDate: DateTime(2018, 1, 10),
        phoneNumber: '+1-555-0202',
      ),
      Teacher(
        id: '3',
        firstName: 'Michael',
        lastName: 'Brown',
        email: 'michael.brown@school.edu',
        department: 'English',
        qualifications: 'MA in English Literature',
        hireDate: DateTime(2016, 9, 5),
        phoneNumber: '+1-555-0203',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(child: Text(teacher.firstName[0])),
              title: Text(teacher.fullName),
              subtitle: Text('${teacher.department} • ${teacher.email}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to teacher detail page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new teacher
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
