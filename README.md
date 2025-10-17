# School Management System

A comprehensive Flutter-based school management system that helps schools manage students, teachers, courses, grades, and attendance efficiently across all platforms.

## Features

- Student Management: Track student profiles, enrollment, and academic records
- Teacher Management: Manage faculty profiles and department assignments
- Course Management: Catalog courses with scheduling and enrollment tracking
- Grade Management: Monitor academic performance and assignment tracking
- Attendance Tracking: Daily attendance monitoring with status tracking
- Cross-platform: Native experience across Android, iOS, and web platforms
- Responsive UI: Adapts seamlessly to different screen sizes and orientations

## Getting Started

This project is built with Flutter. To get started:

1. Make sure you have Flutter installed
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to launch the application

### Web Deployment to GitHub Pages

This project is configured for deployment to GitHub Pages:

1. The GitHub Actions workflow is set up in `.github/workflows/deploy.yml`
2. After pushing changes to the `main` branch, the app will be automatically built (`flutter build web`) and the output in `build/web` will be deployed to GitHub Pages
3. Your site will be available at: `https://<your-username>.github.io/school_managment_flutter/`

For detailed deployment instructions, see [DEPLOYMENT.md](DEPLOYMENT.md).

## Development Tools

- Specification-driven development with Speckit tools
- MCPServer integration for enhanced capabilities
- Automated code generation with build_runner
- Comprehensive task management with mise

## Project Structure

- `lib/` - Main Flutter application source code
- `lib/models/` - Data models for students, teachers, courses, etc.
- `lib/views/` - UI screens and components
- `lib/services/` - Business logic and data services
- `lib/core/` - Core utilities and framework integrations
- `web/` - Web-specific configuration and assets
- `.github/workflows/` - GitHub Actions for CI/CD
- `.mise.toml` - Task definitions for development workflow

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
