import 'package:kueski_challenge/domain/error/error.dart';

class InternalServerError extends ServerFailure {
  @override
  List<Object?> get props => [];
}

class ReferralUsedFailure extends ServerFailure {
  ReferralUsedFailure(this.message);

  final String message;
  @override
  List<Object?> get props => [message];
}

class BadRequestFailure extends ServerFailure {
  BadRequestFailure(this.message);

  final String message;
  @override
  List<Object?> get props => [message];
}

class ContentDeletedFailure extends ServerFailure {
  ContentDeletedFailure(this.message);

  final String message;
  @override
  List<Object?> get props => [message];
}
