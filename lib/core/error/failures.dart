import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String message;

  const Failure({required this.title, required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.title = 'Oooops!!',
    required super.message,
  });

  @override
  List<Object?> get props => [];
}
