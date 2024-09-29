import 'package:dartz/dartz.dart';

import 'package:jobs_application/core/error/failures.dart';
import 'package:jobs_application/features/jobs/domain/entities/job_details_entity.dart';

import 'package:jobs_application/features/jobs/domain/entities/job_entity.dart';

import '../../domain/repositories/jobs_repository.dart';
import '../datasources/job_remote_datasource.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource remoteDataSource;

  JobRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final jobs = await remoteDataSource.getJobs();

      return Right(jobs);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JobDetails>> getJobDetails(
      {required String uuid}) async {
    try {
      final jobDetailsModel = await remoteDataSource.getJobDetails(uuid: uuid);

      return Right(jobDetailsModel);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
