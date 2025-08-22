import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:ktoapp/core/utils/log.dart';

import '../exceptions/api_exception.dart';
import '../models/api_response.dart';
import 'dio_interceptor/auth.dart';
import 'dio_interceptor/error.dart';

class NetworkManager {
  static NetworkManager? _instance;
  late Dio _dio;

  NetworkManager._internal() {
    _dio = Dio();
    _initializeDio();
  }

  static NetworkManager get instance {
    _instance ??= NetworkManager._internal();
    return _instance!;
  }

  void _initializeDio() {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.example.com', // 修改为你的 baseUrl
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    );

    _dio.interceptors.addAll([
      ErrorInterceptor(),
      AuthInterceptor(),
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(milliseconds: 500),
          Duration(seconds: 1),
          Duration(seconds: 2),
        ],
        toNoInternetPageNavigator: () async {},
      ),
      // LogInterceptor(
      //   requestBody: false,
      //   responseBody: false,
      //   logPrint: (obj) => logger.d(obj),
      // ),
    ]);
  }

  Future<ApiResponse<T>> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? parser,
  }) async {
    try {
      Response response;

      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'POST':
          response = await _dio.post(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'PUT':
          response = await _dio.put(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case 'DELETE':
          response = await _dio.delete(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        default:
          throw ApiException(
            code: -100,
            message: 'Unsupported request method: $method',
          );
      }

      // Parse response data
      final parsedData = parser != null
          ? parser(response.data)
          : response.data as T?;

      return ApiResponse.success(parsedData);
    } on DioException catch (e) {
      logger.d(">>>>>>>>DioException>>>>> $e");
      final apiException = ErrorInterceptor().handleError(e);
      return ApiResponse.error(apiException.message, code: apiException.code);
    } catch (e) {
      logger.d(">>>>>>>>e>>>>> $e");
      return ApiResponse.error('Unknown error: ${e.toString()}');
    }
  }

  // GET request
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? parser,
  }) {
    return request<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      options: options,
      parser: parser,
    );
  }

  // POST request
  Future<ApiResponse<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? parser,
  }) {
    return request<T>(
      path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      options: options,
      parser: parser,
    );
  }

  // PUT request
  Future<ApiResponse<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? parser,
  }) {
    return request<T>(
      path,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      options: options,
      parser: parser,
    );
  }

  // DELETE request
  Future<ApiResponse<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? parser,
  }) {
    return request<T>(
      path,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      options: options,
      parser: parser,
    );
  }
}
