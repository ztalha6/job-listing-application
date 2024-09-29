import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_application/core/usecase/usecase.dart';

import '../../../domain/entities/job_entity.dart';
import '../../../domain/usecases/get_jobs.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final GetJobsUseCase getJobsUseCase;

  JobsBloc({
    required this.getJobsUseCase,
  }) : super(const JobInitial(jobs: [])) {
    on<GetJobsEvent>((event, emit) async {
      emit(JobLoading(jobs: state.jobs));

      final result = await getJobsUseCase.call(NoPrams());

      result.fold(
        (failure) => emit(JobError(jobs: state.jobs, message: failure.message)),
        (jobs) => emit(JobsState(jobs: jobs)),
      );
    });
  }
}
