import 'package:flutter/material.dart';

import '../../../domain/entities/job_entity.dart';
import '../../job_details/job_details_screen.dart';

class JobListTile extends StatelessWidget {
  final Job job;

  const JobListTile({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDetailsScreen(jobUuid: job.uuid)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Logo
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: job.company.logo != null
                  ? Image.network(
                      job.company.logo,
                      width: 50,
                      height: 50,
                    )
                  : const Icon(Icons.business, size: 50),
            ),
            const SizedBox(width: 16.0),

            // Job Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Job Title
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4.0),

                  // Company Name & Location
                  Text(
                    job.company.name,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),

                  Text(
                    '${job.location.nameEn} · ${job.jobType}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),

                  // Time Ago
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      job.timeAgo,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
