class JobDetails {
  final int id;
  final String uuid;
  final String title;
  final String createdDate;
  final List<int> salaryRange;
  final String locationName;
  final String jobType;
  final String workplaceType;
  final String companyName;
  final String companyLogo;
  final String companyIndustry;
  final String jobDescription;

  JobDetails({
    required this.id,
    required this.uuid,
    required this.title,
    required this.createdDate,
    required this.salaryRange,
    required this.locationName,
    required this.jobType,
    required this.workplaceType,
    required this.companyName,
    required this.companyLogo,
    required this.companyIndustry,
    required this.jobDescription,
  });
}
