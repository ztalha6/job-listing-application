part of 'job_details_bloc.dart';

class JobDetailsState {
  final JobDetails? jobDetails;

  JobDetailsState({required this.jobDetails});
}

final class JobDetailsInitial extends JobDetailsState {
  JobDetailsInitial({required super.jobDetails});
}

class JobDetailsLoading extends JobDetailsState {
  JobDetailsLoading({required super.jobDetails});
}

class JobDetailsError extends JobDetailsState {
  final String message;

  JobDetailsError({required super.jobDetails, required this.message});
}
