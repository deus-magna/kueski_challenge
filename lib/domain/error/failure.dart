import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:kueski_challenge/domain/error/error.dart';

/// Own implementation for error handling, allows errors to be encapsulated in
/// a better way and avoid exceptions from the initial points of the app.
abstract class Failure extends Equatable {
  static Failure fromDio(DioException error) {
    if (error.type == DioExceptionType.connectionError) {
      return InternalServerError();
    }

    switch (error.response!.statusCode) {
      case 400:
      case 401:
      case 404:
        return _manage400Codes(error);
      case 500:
        return InternalServerError();
      default:
        return InternalServerError();
    }
  }

  /// This function is used to manage diferent error types (String and Lists)
  static BadRequestFailure _manage400Codes(DioException error) {
    final data = error.response!.data as Map<String, dynamic>;

    if (data['message'] != null) {
      final dynamic message = data['message'];
      debugPrint('error => $message');
      if (message is String) {
        return BadRequestFailure(message);
      } else if (message is List<dynamic>) {
        return BadRequestFailure(message.join('\n'));
      } else {
        return BadRequestFailure('Ah ocurrido un error en el servidor');
      }
    } else {
      return BadRequestFailure('Ah ocurrido un error en el servidor');
    }
  }
}

abstract class ServerFailure extends Failure {}
