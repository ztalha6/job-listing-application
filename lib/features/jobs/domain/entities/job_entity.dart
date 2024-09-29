import 'package:timeago/timeago.dart' as timeago;

class Job {
  final String title;
  final Company company;
  final Location location;
  final int minSalary;
  final int maxSalary;
  final String jobType;
  final DateTime createdAt;
  final String uuid;

  String get timeAgo {
    return timeago.format(createdAt);
  }

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.minSalary,
    required this.maxSalary,
    required this.jobType,
    required this.createdAt,
    required this.uuid,
  });
}

class Company {
  final String name;
  final String logo;

  Company({required this.name, required this.logo});
}

class Location {
  final String nameEn;

  Location({required this.nameEn});
}
