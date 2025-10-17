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
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate crossAxisCount based on screen width for responsiveness
            int crossAxisCount = constraints.maxWidth < 600 ? 2 : 
                                constraints.maxWidth < 900 ? 3 : 4;
            
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                shrinkWrap: true,
                childAspectRatio: 1.0, // Make cards more square-like
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
            );
          },
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
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon, 
                size: 36, // Smaller icon
                color: color,
              ),
              const SizedBox(height: 8), // Smaller spacing
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14, // Smaller font
                  fontWeight: FontWeight.w600,
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
