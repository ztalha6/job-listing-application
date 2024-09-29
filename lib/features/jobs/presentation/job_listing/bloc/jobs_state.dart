part of 'jobs_bloc.dart';

class JobsState extends Equatable {
  final List<Job> jobs;

  const JobsState({required this.jobs});

  @override
  List<Object> get props => [];
}

class JobInitial extends JobsState {
  const JobInitial({required super.jobs});
}

class JobLoading extends JobsState {
  const JobLoading({required super.jobs});
}

class JobError extends JobsState {
  final String message;

  const JobError({required super.jobs, required this.message});
}
