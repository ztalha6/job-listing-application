import 'package:dartz/dartz.dart';
import 'package:jobs_application/core/error/failures.dart';
import 'package:jobs_application/features/jobs/domain/entities/job_details_entity.dart';
import 'package:jobs_application/features/jobs/domain/entities/job_entity.dart';

abstract class JobRepository {
  Future<Either<Failure, List<Job>>> getJobs();
  Future<Either<Failure, JobDetails>> getJobDetails({required String uuid});
}
