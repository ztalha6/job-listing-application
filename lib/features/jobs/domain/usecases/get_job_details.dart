import 'package:dartz/dartz.dart';
import 'package:jobs_application/core/error/failures.dart';
import 'package:jobs_application/core/usecase/usecase.dart';
import 'package:jobs_application/features/jobs/domain/repositories/jobs_repository.dart';

import '../entities/job_details_entity.dart';

class GetJobDetailsUseCase implements UseCase<JobDetails, String> {
  final JobRepository jobRepository;

  GetJobDetailsUseCase({required this.jobRepository});

  @override
  Future<Either<Failure, JobDetails>> call(String params) =>
      jobRepository.getJobDetails(uuid: params);
}
