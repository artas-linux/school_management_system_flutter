import 'package:flutter/material.dart';
import '../models/attendance.dart';
import 'school_management_drawer.dart';

class AttendanceListScreen extends StatelessWidget {
  const AttendanceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from a provider or service
    final List<Attendance> attendanceRecords = [
      Attendance(
        id: '1',
        studentId: '1',
        courseId: '1',
        date: DateTime(2023, 10, 1),
        status: AttendanceStatus.present,
        notes: 'Active participation in class',
      ),
      Attendance(
        id: '2',
        studentId: '1',
        courseId: '1',
        date: DateTime(2023, 10, 2),
        status: AttendanceStatus.absent,
        notes: 'Absent due to illness',
      ),
      Attendance(
        id: '3',
        studentId: '2',
        courseId: '2',
        date: DateTime(2023, 10, 1),
        status: AttendanceStatus.late,
        notes: 'Arrived 15 minutes late',
      ),
      Attendance(
        id: '4',
        studentId: '3',
        courseId: '3',
        date: DateTime(2023, 10, 1),
        status: AttendanceStatus.excused,
        notes: 'Family emergency - note provided',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: ListView.builder(
        itemCount: attendanceRecords.length,
        itemBuilder: (context, index) {
          final attendance = attendanceRecords[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: _getStatusIcon(attendance.status),
              title: Text('Student ID: ${attendance.studentId}'),
              subtitle: Text(
                'Course ID: ${attendance.courseId}\n'
                '${attendance.date.toString().split(' ')[0]} • ${attendance.status.displayName}',
              ),
              trailing: Text(
                attendance.status.displayName,
                style: TextStyle(
                  color: _getStatusColor(attendance.status),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to attendance detail page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new attendance record
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Icon _getStatusIcon(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return const Icon(Icons.check_circle, color: Colors.green);
      case AttendanceStatus.absent:
        return const Icon(Icons.cancel, color: Colors.red);
      case AttendanceStatus.late:
        return const Icon(Icons.access_time, color: Colors.orange);
      case AttendanceStatus.excused:
        return const Icon(Icons.event_available, color: Colors.blue);
    }
  }

  Color _getStatusColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.late:
        return Colors.orange;
      case AttendanceStatus.excused:
        return Colors.blue;
    }
  }
}
