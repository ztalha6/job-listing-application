import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobs_application/features/jobs/domain/entities/job_entity.dart';
import 'package:jobs_application/features/jobs/presentation/job_details/job_details_screen.dart';
import 'package:jobs_application/features/jobs/presentation/job_listing/widgets/job_tile.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_application/features/jobs/presentation/job_listing/pages/job_list_page.dart';
import 'package:jobs_application/features/jobs/presentation/job_listing/bloc/jobs_bloc.dart';

class MockJobsBloc extends MockBloc<JobsEvent, JobsState> implements JobsBloc {}

void main() {
  late MockJobsBloc mockJobsBloc;

  setUp(() {
    mockJobsBloc = MockJobsBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<JobsBloc>(
        create: (_) => mockJobsBloc,
        child: const JobListPage(),
      ),
    );
  }

  testWidgets('should load jobs and navigate to job details',
      (WidgetTester tester) async {
    // Arrange: Mock the state when jobs are successfully loaded
    final mockJob = Job(
      uuid: '123',
      title: 'Flutter Developer',
      company:
          Company(name: 'TechCorp', logo: 'https://via.placeholder.com/150'),
      location: Location(nameEn: 'San Francisco'),
      jobType: 'Full-time',
      minSalary: 10,
      maxSalary: 100,
      createdAt: DateTime.now(),
    );

    whenListen(
      mockJobsBloc,
      Stream<JobsState>.fromIterable([
        const JobLoading(jobs: []),
        JobsState(jobs: [mockJob]),
      ]),
      initialState: const JobLoading(jobs: []),
    );

    // Act: Load the widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Wait for the UI to settle (asynchronous actions complete)
    await tester.pumpAndSettle();

    // Assert: Verify jobs loaded and displayed
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.byType(JobListTile), findsOneWidget);

    // Act: Tap on the job list tile
    await tester.tap(find.byType(JobListTile));
    await tester.pumpAndSettle();

    // Assert: Verify navigation to the JobDetailsScreen
    expect(find.byType(JobDetailsScreen), findsOneWidget);
    expect(find.text('Flutter Developer'),
        findsOneWidget); // Job details page title
  });
}
