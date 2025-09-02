
import 'failure.dart';

import 'package:dio/dio.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {


    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      // AppLogger.logger.e(error);
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return NetworkFailure("Превышено время ожидания.");
        case DioExceptionType.badResponse:
          switch (statusCode) {
            case 401:
            case 403:
              return UnauthorizedFailure("Вы не авторизованы.");
            case 404:
              return ServerFailure("Ресурс не найден.");
            case 500:
            case 530:
              return ServerFailure("Ошибка сервера. Повторите позже.");
            default:
              return ServerFailure("Ошибка ответа от сервера.");
          }
        case DioExceptionType.cancel:
          return ServerFailure("Запрос отменён.");
        case DioExceptionType.unknown:
        default:
          return UnknownFailure("Неизвестная ошибка.");
      }
    }  else {
      
      return UnknownFailure("Произошла неизвестная ошибка.");
    }
  }
}
