import 'package:flutter/material.dart';

class PresentationSlides extends StatefulWidget {
  const PresentationSlides({super.key});

  @override
  State<PresentationSlides> createState() => _PresentationSlidesState();
}

class _PresentationSlidesState extends State<PresentationSlides> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _slides = [
    {
      'title': 'Welcome to School Management System',
      'content': 'A comprehensive solution for modern educational institutions. Streamline operations and enhance educational experiences with our Flutter-based application.',
      'icon': Icons.school,
    },
    {
      'title': 'Student Management',
      'content': 'Track student profiles, enrollment, academic records, and attendance efficiently. Manage student data in one centralized location.',
      'icon': Icons.person,
    },
    {
      'title': 'Teacher Management',
      'content': 'Manage faculty profiles, department assignments, and course responsibilities. Easily access teacher information and schedules.',
      'icon': Icons.people,
    },
    {
      'title': 'Course & Grade Management',
      'content': 'Catalog courses with scheduling and monitor academic performance. Track assignments and grades with detailed analytics.',
      'icon': Icons.book,
    },
    {
      'title': 'Attendance Tracking',
      'content': 'Daily attendance records with status tracking (present, absent, late, excused). Real-time monitoring and reporting capabilities.',
      'icon': Icons.check_circle,
    },
    {
      'title': 'Cross-Platform Support',
      'content': 'Native experience across Android, iOS, and web platforms. Access your management system from any device, anywhere.',
      'icon': Icons.devices,
    },
    {
      'title': 'Transform Your School Management',
      'content': 'Simplify administrative tasks, improve communication, and enhance educational outcomes. Get started today with our comprehensive solution.',
      'icon': Icons.emoji_objects,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Management Presentation'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          slide['icon'] as IconData,
                          size: 80,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          slide['title'] as String,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          slide['content'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    _slides.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index 
                          ? Theme.of(context).colorScheme.primary 
                          : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _currentPage < _slides.length - 1
          ? FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_forward),
            )
          : null,
    );
  }
}