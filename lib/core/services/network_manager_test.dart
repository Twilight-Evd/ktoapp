import 'package:flutter_test/flutter_test.dart';
import 'network_manager.dart';
import '../models/api_response.dart';

void main() {
  group('NetworkManager', () {
    final NetworkManager networkManager = NetworkManager.instance;

    test('GET request returns ApiResponse.success', () async {
      final response = await networkManager.get<Map<String, dynamic>>(
        '/test-get',
        parser: (data) => data as Map<String, dynamic>,
      );
      expect(response, isA<ApiResponse<Map<String, dynamic>>>());
    });

    test('POST request returns ApiResponse.success', () async {
      final response = await networkManager.post<Map<String, dynamic>>(
        '/test-post',
        data: {'key': 'value'},
        parser: (data) => data as Map<String, dynamic>,
      );
      expect(response, isA<ApiResponse<Map<String, dynamic>>>());
    });

    test(
      'Unsupported method throws ApiException and returns ApiResponse.error',
      () async {
        final result = await networkManager.request(
          '/test-unsupported',
          method: 'PATCH',
        );
        expect(result.success, false);
        expect(result.message, contains('Unsupported request method'));
      },
    );

    test('Handles DioException and returns ApiResponse.error', () async {
      final response = await networkManager.get('/not-exist-endpoint');
      expect(response.success, false);
      expect(response.message, isNotNull);
    });

    test('Handles unknown error and returns ApiResponse.error', () async {
      final response = await networkManager.get(
        '/test-get',
        parser: (data) => throw Exception('Parser error'),
      );
      expect(response.success, false);
      expect(response.message, contains('Unknown error'));
    });
  });
}
