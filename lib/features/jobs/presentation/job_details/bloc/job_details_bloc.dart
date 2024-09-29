import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/job_details_entity.dart';
import '../../../domain/usecases/get_job_details.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  final GetJobDetailsUseCase getJobDetailsUseCase;

  JobDetailsBloc({
    required this.getJobDetailsUseCase,
  }) : super(JobDetailsInitial(
          jobDetails: null,
        )) {
    on<GetJobDetailsEvent>((event, emit) async {
      emit(JobDetailsLoading(jobDetails: state.jobDetails));

      final failureOrJobDetails = await getJobDetailsUseCase.call(event.uuid);

      failureOrJobDetails.fold(
        (failure) => emit(
          JobDetailsError(
            jobDetails: state.jobDetails,
            message: failure.message,
          ),
        ),
        (jobDetails) => emit(JobDetailsState(jobDetails: jobDetails)),
      );
    });
  }
}
