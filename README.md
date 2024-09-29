# Job Listing Application

This is a Flutter-based application for browsing job listings, built using Clean Architecture principles and Bloc for state management.

## Table of Contents

1. [Running the Application](#running-the-application)
2. [Running Tests](#running-tests)
3. [Design Choices](#design-choices)
4. [Code Organization](#code-organization)

## Running the Application

### Prerequisites

To run the application locally, ensure you have the following setup:

1. **Flutter SDK**:

   - Install Flutter from [Flutter's official website](https://flutter.dev/docs/get-started/install).
   - Verify Flutter installation by running:
     ```bash
     flutter doctor
     ```

2. **Dependencies**:

   - Install all necessary dependencies by running:
     ```bash
     flutter pub get
     ```

3. **Android/iOS Emulator or Physical Device**:

   - Ensure an emulator is running or a physical device is connected.

4. **API**:
   - The app fetches job listings and details from a remote API. Ensure the API is accessible or mock it for local testing.

### Running the App

Once everything is set up, run the following command in the root directory of the project:

```bash
flutter run
```

## Running Tests

The Job Listing application includes various tests to ensure that the core functionalities are working as expected. This guide will help you run all tests, as well as specific tests, using the Flutter testing framework.

### Prerequisites

Before running the tests, ensure the following:

1. **Flutter SDK** is installed and properly configured. Run:
   ```bash
   flutter doctor
   ```
2. All dependencies are installed:
   ```bash
   flutter pub get
   ```

## Running All Tests

To run all the unit, widget, and integration tests, execute the following command from the project root directory:

```bash
flutter test
flutter test test/path_to_test_file.dart
```

## Design Choices

This document explains the key design choices made while developing the Job Listing application, focusing on architecture, state management, and dependency injection.

## Clean Architecture

The application is built using **Clean Architecture** principles, which aim to separate concerns across multiple layers. This makes the application more scalable, testable, and maintainable.

The layers are:

1. **Data Layer**: Handles data fetching from APIs or other external sources. This includes repositories and data sources.
2. **Domain Layer**: Contains the business logic, including use cases that interact with repositories.
3. **Presentation Layer**: Manages the user interface (UI) and the application’s state, making use of **Bloc** for state management.

### State Management: Bloc

State management in the Job Listing app is handled by the **Bloc** pattern. Each screen has its own Bloc responsible for managing its state transitions:

- **JobListBloc**: Handles the loading, success, and failure states of the job listing page.
- **JobDetailsBloc**: Manages the job details page, ensuring that data is fetched from the API and presented to the user.

### Why Bloc?

- **Separation of concerns**: Bloc helps us keep the UI code and business logic separate.
- **Testability**: It’s easy to write unit tests for the business logic in Blocs.
- **Scalability**: The app can grow in complexity while keeping each screen’s state management isolated.

### Dependency Injection: GetIt

The application uses **GetIt** for dependency injection to ensure loose coupling between components. This approach allows for easier testing and modification of dependencies without breaking the code.

In `main.dart`, dependencies such as repositories and data sources are registered via GetIt:

```dart
void setup() {
  sl.registerSingleton(http.Client());
  sl.registerSingleton<JobRemoteDataSourceImpl>(
      JobRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerSingleton<JobRepositoryImpl>(
      JobRepositoryImpl(remoteDataSource: sl<JobRemoteDataSourceImpl>()));
}
```

## Code Organization

This section explains the structure of the codebase for the Job Listing application, built with **Clean Architecture** principles. The code is organized into layers, each responsible for a specific part of the application's functionality, ensuring separation of concerns and easier maintainability.

### Directory Structure

The main directory structure of the application is as follows:

```plaintext
lib/
├── core/                         # Core utilities, constants, and shared functionality
├── features/                     # Each feature of the app, such as jobs
│   ├── jobs/
│   │   ├── data/                 # Data layer: Repositories, data sources, and models
│   │   ├── domain/               # Domain layer: Entities, use cases, and repository interfaces
│   │   └── presentation/         # Presentation layer: UI and state management (Bloc)
├── main.dart                     # Entry point of the application
└── ...
```
