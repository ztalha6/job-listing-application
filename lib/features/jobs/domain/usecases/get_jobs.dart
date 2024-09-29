import 'package:dartz/dartz.dart';
import 'package:jobs_application/core/error/failures.dart';
import 'package:jobs_application/core/usecase/usecase.dart';
import 'package:jobs_application/features/jobs/domain/repositories/jobs_repository.dart';

import '../entities/job_entity.dart';

class GetJobsUseCase implements UseCase<List<Job>, NoPrams> {
  final JobRepository jobRepository;

  GetJobsUseCase({required this.jobRepository});

  @override
  Future<Either<Failure, List<Job>>> call(NoPrams params) =>
      jobRepository.getJobs();
}
