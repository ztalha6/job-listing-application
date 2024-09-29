import 'dart:convert';

import 'package:jobs_application/features/jobs/domain/entities/job_details_entity.dart';

import '../models/job_details_model.dart';
import '../models/job_model.dart';
import 'package:http/http.dart' as http;

abstract class JobRemoteDataSource {
  Future<List<JobModel>> getJobs();
  Future<JobDetails> getJobDetails({required String uuid});
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final http.Client client;

  JobRemoteDataSourceImpl({required this.client});

  final String baseUrl = "https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs";

  @override
  Future<List<JobModel>> getJobs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((jobJson) => JobModel.fromJson(jobJson)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  @override
  Future<JobDetails> getJobDetails({required String uuid}) async {
    final response = await client.get(Uri.parse('$baseUrl/$uuid'));

    if (response.statusCode == 200) {
      return JobDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load job details');
    }
  }
}
