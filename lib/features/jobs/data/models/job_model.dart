import '../../domain/entities/job_entity.dart';

class JobModel extends Job {
  JobModel({
    required super.title,
    required CompanyModel super.company,
    required LocationModel super.location,
    required super.minSalary,
    required super.maxSalary,
    required super.jobType,
    required super.createdAt,
    required super.uuid,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['job']['title'],
      company: CompanyModel.fromJson(json['job']['company']),
      location: LocationModel.fromJson(json['job']['location']),
      minSalary: json['job']['salary_range'][0],
      maxSalary: json['job']['salary_range'][1],
      jobType: json['job']['workplace_type']['name_en'],
      createdAt: DateTime.parse(json['job']['created_date']),
      uuid: json['job']['uuid'],
    );
  }
}

class LocationModel extends Location {
  LocationModel({required super.nameEn});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(nameEn: json['name_en']);
  }
}

class CompanyModel extends Company {
  CompanyModel({required super.name, required super.logo});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(name: json['name'], logo: json['logo']);
  }
}
