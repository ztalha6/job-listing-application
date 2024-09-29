part of 'job_details_bloc.dart';

sealed class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetJobDetailsEvent extends JobDetailsEvent {
  final String uuid;

  const GetJobDetailsEvent(this.uuid);
}
