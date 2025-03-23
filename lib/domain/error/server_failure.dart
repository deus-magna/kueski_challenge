import 'package:kueski_challenge/domain/error/error.dart';

class InternalServerError extends ServerFailure {
  @override
  List<Object?> get props => [];
}

class BadRequestFailure extends ServerFailure {
  BadRequestFailure(this.message);

  final String message;
  @override
  List<Object?> get props => [message];
}
