import 'package:flutter/material.dart';
import 'school_management_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Management System'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const SchoolManagementDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildDashboardCard(
              context,
              'Students',
              Icons.school,
              Colors.blue,
              () {
                Navigator.pushNamed(context, '/students');
              },
            ),
            _buildDashboardCard(
              context,
              'Teachers',
              Icons.person,
              Colors.green,
              () {
                Navigator.pushNamed(context, '/teachers');
              },
            ),
            _buildDashboardCard(
              context,
              'Courses',
              Icons.book,
              Colors.orange,
              () {
                // Navigate to courses screen
              },
            ),
            _buildDashboardCard(
              context,
              'Grades',
              Icons.grade,
              Colors.purple,
              () {
                // Navigate to grades screen
              },
            ),
            _buildDashboardCard(
              context,
              'Attendance',
              Icons.check_circle,
              Colors.teal,
              () {
                // Navigate to attendance screen
              },
            ),
            _buildDashboardCard(
              context,
              'Schedule',
              Icons.schedule,
              Colors.red,
              () {
                // Navigate to schedule screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
