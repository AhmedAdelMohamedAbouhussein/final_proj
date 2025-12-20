import 'package:dio/dio.dart';

class AppException {
  final String errorMessage;
  final int? errorCode;

  AppException({required this.errorMessage, this.errorCode});

  static AppException fromDioException(DioException exception)
  {
    switch (exception.type)
    {
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
        return AppException(errorMessage: 'Timeout, Try Again');
      case DioExceptionType.badCertificate:
        return AppException(errorMessage: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return AppException(errorMessage: 'Bad Response');
      case DioExceptionType.unknown:
        return AppException(
          errorMessage: exception.response?.statusMessage ?? 'Invalid response',
        );
      case DioExceptionType.connectionError:
        return AppException(errorMessage: 'Connection Error');
      default:
        return AppException(errorMessage: 'Something went wrong');
    }
  }
}