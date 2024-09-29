import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_application/features/jobs/data/repositories/job_repository_impl.dart';
import 'package:jobs_application/features/jobs/domain/usecases/get_job_details.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../main.dart';
import '../job_listing/widgets/custom_chip.dart';
import 'bloc/job_details_bloc.dart';

class JobDetailsScreen extends StatelessWidget {
  final String jobUuid;

  const JobDetailsScreen({super.key, required this.jobUuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.primarySwatch,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => JobDetailsBloc(
            getJobDetailsUseCase: GetJobDetailsUseCase(
          jobRepository: sl<JobRepositoryImpl>(),
        ))
          ..add(GetJobDetailsEvent(jobUuid)),
        child: BlocBuilder<JobDetailsBloc, JobDetailsState>(
          builder: (context, state) {
            if (state is JobDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.jobDetails != null) {
              final jobDetails = state.jobDetails;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(jobDetails!.companyLogo,
                                  width: 50, height: 50),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(jobDetails.companyName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text(jobDetails.companyIndustry),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(jobDetails.title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(
                            "${jobDetails.locationName} • ${jobDetails.workplaceType} • ${jobDetails.jobType}"),
                        const SizedBox(height: 10),
                        const Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            CustomChip(text: 'B2B'),
                            CustomChip(text: 'Sales'),
                            CustomChip(text: 'No Experience'),
                            CustomChip(text: 'Beginner English'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text("Job Description:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(jobDetails.jobDescription),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      AppColors.primarySwatch,
                                    ),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 16),
                                    )),
                                onPressed: () {},
                                child: const Text(
                                  'Apply',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is JobDetailsError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
