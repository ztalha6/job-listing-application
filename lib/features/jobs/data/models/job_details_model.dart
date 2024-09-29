import '../../domain/entities/job_details_entity.dart';

class JobDetailsModel extends JobDetails {
  JobDetailsModel({
    required super.id,
    required super.uuid,
    required super.title,
    required super.createdDate,
    required super.salaryRange,
    required super.locationName,
    required super.jobType,
    required super.workplaceType,
    required super.companyName,
    required super.companyLogo,
    required super.companyIndustry,
    required super.jobDescription,
  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) {
    return JobDetailsModel(
      id: json['data']['id'],
      uuid: json['data']['uuid'],
      title: json['data']['title'],
      createdDate: json['data']['created_date'],
      salaryRange: List<int>.from(json['data']['salary_range']),
      locationName: json['data']['location']['name_en'],
      jobType: json['data']['type']['name_en'],
      workplaceType: json['data']['workplace_type']['name_en'],
      companyName: json['data']['company']['name'],
      companyLogo: json['data']['company']['logo'],
      companyIndustry: json['data']['company']['industry'],
      jobDescription: json['data']['icp_answers']['job-role'][0]
          ['description_en'],
    );
  }
}
