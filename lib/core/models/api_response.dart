class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? code;

  ApiResponse({required this.success, this.data, this.message, this.code});

  factory ApiResponse.success(T? data) {
    return ApiResponse(success: true, data: data);
  }

  factory ApiResponse.error(String message, {int? code}) {
    return ApiResponse(success: false, message: message, code: code);
  }

  @override
  String toString() {
    return 'ApiResponse(success: $success, data: $data, message: $message, code: $code)';
  }
}
