import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SchoolManagementDrawer extends StatelessWidget {
  const SchoolManagementDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  SchoolManagementConstants.appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Manage your school efficiently',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.dashboardRoute,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Students'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.studentsRoute,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Teachers'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.teachersRoute,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Courses'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.coursesRoute,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text('Grades'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.gradesRoute,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text('Attendance'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                SchoolManagementConstants.attendanceRoute,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Navigate to help & support
            },
          ),
        ],
      ),
    );
  }
}
