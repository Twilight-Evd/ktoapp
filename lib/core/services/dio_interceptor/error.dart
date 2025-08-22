import 'package:dio/dio.dart';

import '../../exceptions/api_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handleError(err);
    super.onError(err, handler);
  }

  ApiException handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          code: -1,
          message: 'Connection timeout, please check your network settings',
          details: error.message,
        );

      case DioExceptionType.sendTimeout:
        return ApiException(
          code: -2,
          message: 'Request timeout, please try again later',
          details: error.message,
        );

      case DioExceptionType.receiveTimeout:
        return ApiException(
          code: -3,
          message: 'Response timeout, please try again later',
          details: error.message,
        );

      case DioExceptionType.badResponse:
        return _handleHttpError(error);

      case DioExceptionType.cancel:
        return ApiException(
          code: -4,
          message: 'Request cancelled',
          details: error.message,
        );

      case DioExceptionType.unknown:
        if (error.error.toString().contains('Network is unreachable')) {
          return ApiException(
            code: -5,
            message: 'Network unavailable, please check your connection',
            details: error.message,
          );
        }
        return ApiException(
          code: -6,
          message: 'Unknown error, please try again later',
          details: error.message,
        );

      default:
        return ApiException(
          code: -7,
          message: 'Network error, please try again later',
          details: error.message,
        );
    }
  }

  ApiException _handleHttpError(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return ApiException(
          code: 400,
          message: 'Bad request parameters',
          details: _extractErrorMessage(error.response?.data),
        );

      case 401:
        return ApiException(
          code: 401,
          message: 'Session expired, please login again',
          details: _extractErrorMessage(error.response?.data),
        );

      case 403:
        return ApiException(
          code: 403,
          message: 'Access denied',
          details: _extractErrorMessage(error.response?.data),
        );

      case 404:
        return ApiException(
          code: 404,
          message: 'Resource not found',
          details: _extractErrorMessage(error.response?.data),
        );

      case 422:
        return ApiException(
          code: 422,
          message: 'Data validation failed',
          details: _extractErrorMessage(error.response?.data),
        );

      case 500:
        return ApiException(
          code: 500,
          message: 'Internal server error, please try again later',
          details: _extractErrorMessage(error.response?.data),
        );

      case 502:
        return ApiException(
          code: 502,
          message: 'Gateway error, please try again later',
          details: _extractErrorMessage(error.response?.data),
        );

      case 503:
        return ApiException(
          code: 503,
          message: 'Service unavailable, please try again later',
          details: _extractErrorMessage(error.response?.data),
        );

      default:
        return ApiException(
          code: statusCode,
          message: 'HTTP $statusCode error',
          details: _extractErrorMessage(error.response?.data),
        );
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      // Try to extract error message from common fields
      return data['message'] ?? data['error'] ?? data['msg'] ?? data['detail'];
    }

    return data.toString();
  }
}
