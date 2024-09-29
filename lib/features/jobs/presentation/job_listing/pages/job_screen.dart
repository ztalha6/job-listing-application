import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_application/features/jobs/data/repositories/job_repository_impl.dart';
import 'package:jobs_application/features/jobs/domain/usecases/get_jobs.dart';
import 'package:jobs_application/main.dart';

import '../bloc/jobs_bloc.dart';
import '../widgets/job_tile.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsBloc(
          getJobsUseCase:
              GetJobsUseCase(jobRepository: sl<JobRepositoryImpl>()))
        ..add(GetJobsEvent()),
      child: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JobError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state.jobs.isNotEmpty) {
            return ListView.builder(
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return JobListTile(job: state.jobs[index]);
              },
            );
          } else {
            return const Center(child: Text('No Jobs Available'));
          }
        },
      ),
    );
  }
}
