import '../exceptions/api_exception.dart';
import '../models/api_response.dart';

abstract class BaseRepository {
  T handleResponse<T>(
    ApiResponse<dynamic> resp,
    T Function(dynamic data) parser,
  ) {
    if (resp.success) {
      try {
        return parser(resp.data);
      } catch (e) {
        throw ApiException(message: 'Data parsing error: $e', code: 400);
      }
    }
    if (resp.code == 401) {
      throw UnauthorizedException(details: resp.message);
    }
    throw ApiException(
      message: resp.message ?? "Unknown error",
      code: resp.code ?? 400,
    );
  }
}
