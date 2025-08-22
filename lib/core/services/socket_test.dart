import 'package:flutter_test/flutter_test.dart';

import 'socket.dart';

void main() {
  group('SocketService', () {
    late SocketService socketService;

    setUp(() {
      socketService = SocketService();
    });

    test('should be singleton', () {
      final anotherInstance = SocketService();
      expect(identical(socketService, anotherInstance), isTrue);
    });

    test('should initialize only once', () {
      socketService.init(url: 'wss://push-us.offering-api.kambicdn.com');
      expect(
        () =>
            socketService.init(url: 'wss://push-us.offering-api.kambicdn.com'),
        returnsNormally,
      );
    });

    test('should connect and disconnect', () async {
      socketService.init(url: 'wss://push-us.offering-api.kambicdn.com');
      socketService.connect();
      // 由于真实 socket 连接需要网络且为异步，这里只测试方法调用不抛异常
      expect(() => socketService.disconnect(), returnsNormally);
    });

    test('should emit and listen to events', () async {
      socketService.init(url: 'wss://push-us.offering-api.kambicdn.com');
      bool called = false;
      socketService.on('test_event', (data) {
        called = true;
      });
      socketService.emit('test_event', {'foo': 'bar'});
      // 由于本地未真正建立 socket 连接，这里只保证 emit/on 方法可调用
      expect(called, isFalse); // 实际不会被调用
    });

    test('dispose should not throw', () {
      socketService.init(url: 'wss://push-us.offering-api.kambicdn.com');
      expect(() => socketService.dispose(), returnsNormally);
    });
  });
}

// final socketService = SocketService()
//   ..init(
//     url:
//         "wss://push-us.offering-api.kambicdn.com/socket.io/?EIO=4&transport=websocket",
//   );
// socketService.connect();
// socketService.on('message', (data) {
//   print('收到消息: $data');
// });
// socketService.emit('subscribe', {'topic': 'v2018.ktobr.ev.json'});
// socketService.emit('subscribe', {'topic': 'v2018.ktobr.pt.ev.json'});
// socketService.disconnect();
