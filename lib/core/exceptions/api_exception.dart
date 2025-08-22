class ApiException implements Exception {
  final int code;
  final String message;
  final String? details;

  ApiException({required this.code, required this.message, this.details});

  @override
  String toString() => 'ApiException(code: $code, message: $message)';
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String? details})
    : super(code: 401, message: "Unauthorized", details: details);
}
