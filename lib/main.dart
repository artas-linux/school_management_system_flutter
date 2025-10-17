import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme_provider.dart';
import 'views/dashboard_screen.dart';
import 'views/students_list_screen.dart';
import 'views/teachers_list_screen.dart';
import 'views/courses_list_screen.dart';
import 'views/grades_list_screen.dart';
import 'views/attendance_list_screen.dart';
import 'views/settings_screen.dart';

void main() {
  runApp(const SchoolManagementApp());
}

class SchoolManagementApp extends StatelessWidget {
  const SchoolManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'School Management System',
            theme: ThemeProvider.lightTheme,
            darkTheme: ThemeProvider.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const DashboardScreen(),
              '/students': (context) => const StudentsListScreen(),
              '/teachers': (context) => const TeachersListScreen(),
              '/courses': (context) => const CoursesListScreen(),
              '/grades': (context) => const GradesListScreen(),
              '/attendance': (context) => const AttendanceListScreen(),
              '/settings': (context) => const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
