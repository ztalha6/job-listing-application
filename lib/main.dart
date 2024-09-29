import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_application/core/constants/color_constants.dart';
import 'package:jobs_application/features/jobs/presentation/job_listing/pages/job_list_page.dart';

import 'features/jobs/data/datasources/job_remote_datasource.dart';
import 'features/jobs/data/repositories/job_repository_impl.dart';

final sl = GetIt.I;

void setup() {
  // Register HTTP client
  sl.registerSingleton(http.Client());

  // Register Remote Data Source
  sl.registerSingleton<JobRemoteDataSourceImpl>(
      JobRemoteDataSourceImpl(client: sl<http.Client>()));

  // Register Repository
  sl.registerSingleton<JobRepositoryImpl>(
      JobRepositoryImpl(remoteDataSource: sl<JobRemoteDataSourceImpl>()));
}

void main() {
  setup(); // Set up dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Listing App',
      theme: ThemeData(
          primaryColor: AppColors.primarySwatch,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: false,
          )),
      home: const JobListPage(), // Adjust this to your initial screen
    );
  }
}
