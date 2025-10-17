# School Management Flutter Application - Development Context

## Project Overview

This is a Flutter-based school management application that follows a specification-driven development approach. The project uses the Speckit framework for task management and follows a structured development workflow with specifications, planning, and implementation tasks.

## Technology Stack

- **Flutter**: 3.35.1 (primary framework)
- **Dart**: latest version (primary language)
- **Bun**: latest version (for additional tooling)
- **mise**: Used for task management and environment configuration

## Project Structure

The project follows a specification-driven development approach with the following key directories:

- `.mise.toml`: Task definitions and environment configuration
- `.specify/`: Specification-driven development tooling
  - `memory/`: Project constitution and principles
  - `scripts/`: Development scripts
  - `templates/`: Templates for specs, plans, tasks
- `.qwen/`: AI assistant configuration
  - `commands/`: Speckit command definitions
- `specs/`: Feature specifications (not yet created)

## Key Development Commands

The project uses mise for task management. Key commands include:

### Development Setup
- `mise run setup` - Initial project setup
- `mise run dev` - Start development server
- `mise run dev-web` - Start web development server

### Code Generation & Quality
- `mise run gen` - Execute code generation (build_runner)
- `mise run fix` - Code analysis, formatting and fixing
- `mise run watch` - Watch files and generate code on changes

### Testing & Coverage
- `mise run test` - Run tests with coverage
- `mise run coverage` - Generate HTML coverage report

### Building
- `mise run build-android` - Build Android APK/AAB
- `mise run build-ios` - Build iOS IPA
- `mise run build-web` - Build web version

### Maintenance
- `mise run clean` - Project cleanup
- `mise run upgrade` - Update dependencies

### Special Integration
- `mise run firebase` - Firebase project setup
- `mise run help` - List all available commands

## Development Workflow

The project follows a specification-driven development approach:

1. **Specification Phase**: Use `speckit.specify` command to create feature specifications
2. **Clarification Phase**: Use `speckit.clarify` to resolve ambiguities
3. **Planning Phase**: Use `speckit.plan` to generate implementation plans
4. **Task Generation**: Use `speckit.tasks` to generate actionable task lists
5. **Analysis**: Use `speckit.analyze` for consistency checks
6. **Implementation**: Use `speckit.implement` to execute tasks

## Speckit Commands

Available Speckit commands (in `.qwen/commands/`):
- `speckit.analyze` - Cross-artifact consistency analysis
- `speckit.checklist` - Generate custom checklists
- `speckit.clarify` - Clarify underspecified areas
- `speckit.constitution` - Update project constitution
- `speckit.implement` - Execute implementation plan
- `speckit.plan` - Generate implementation planning
- `speckit.specify` - Create feature specifications
- `speckit.tasks` - Generate actionable tasks

## Project Constitution

The project follows a constitution-based development approach (`.specify/memory/constitution.md`) with principles around:
- Test-first development
- Integration testing
- Observability
- Versioning and breaking changes
- Simplicity

## Code Generation

The project uses build_runner for code generation, particularly relevant for:
- JSON serialization
- Dependency injection
- Other automated code generation tasks

## Key Dart/Flutter Packages

Based on the project structure, this is likely using standard Flutter packages plus:
- `build_runner` - For code generation
- `firebase_*` packages (based on firebase setup task)

## Development Conventions

1. **Feature Branches**: Named with numeric prefixes (e.g., `001-feature-name`)
2. **Specification-Driven**: Features are defined in specs before implementation
3. **Task-Driven Implementation**: Implementation follows generated task lists
4. **Code Generation**: Uses build_runner for automated code generation
5. **Quality Focus**: Comprehensive testing and coverage requirements

## Environment Setup

The project uses mise to ensure consistent development environments across team members with pre-configured tools and versions for Flutter, Dart and Bun.
