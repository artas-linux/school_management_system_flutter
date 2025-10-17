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
import 'widgets/presentation_slides.dart';
import 'widgets/under_construction_dialog.dart';

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
          return MaterialAppWithDialog(
            themeProvider: themeProvider,
          );
        },
      ),
    );
  }
}

class MaterialAppWithDialog extends StatefulWidget {
  final ThemeProvider themeProvider;

  const MaterialAppWithDialog({
    super.key,
    required this.themeProvider,
  });

  @override
  State<MaterialAppWithDialog> createState() => _MaterialAppWithDialogState();
}

class _MaterialAppWithDialogState extends State<MaterialAppWithDialog> {
  @override
  void initState() {
    super.initState();
    // Show the dialog only in non-test environments in the next frame
    if (!isTestEnvironment()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false, // Prevent dismissing the dialog
            builder: (BuildContext context) {
              return const UnderConstructionDialog();
            },
          );
        }
      });
    }
  }

  bool isTestEnvironment() {
    // Check if running in test mode using a more general approach
    return const bool.fromEnvironment('FLUTTER_TEST');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management System',
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      themeMode: widget.themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/students': (context) => const StudentsListScreen(),
        '/teachers': (context) => const TeachersListScreen(),
        '/courses': (context) => const CoursesListScreen(),
        '/grades': (context) => const GradesListScreen(),
        '/attendance': (context) => const AttendanceListScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/presentation': (context) => const PresentationSlides(),
      },
    );
  }
}