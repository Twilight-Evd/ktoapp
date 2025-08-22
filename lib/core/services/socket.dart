import 'package:socket_io_client/socket_io_client.dart';

import '../utils/log.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  SocketService._internal();

  late Socket _socket;
  bool _initialized = false;

  void init({
    required String url,
    Map<String, dynamic>? query,
    List<String> transports = const ['websocket'],
  }) {
    if (_initialized) return;

    _socket = io(
      'wss://push-us.offering-api.kambicdn.com',
      OptionBuilder()
          .setTransports(['websocket']) // 强制使用 websocket
          .setPath('/socket.io/')
          .disableAutoConnect()
          .build(),
    );

    _socket.onConnect((_) {
      logger.d('✅ Socket connected');
    });

    _socket.onDisconnect((_) {
      logger.d('❌ Socket disconnected');
    });

    _initialized = true;
  }

  void connect() => _socket.connect();
  void disconnect() => _socket.disconnect();
  void dispose() => _socket.dispose();

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  void emit(String event, dynamic data) {
    _socket.emit(event, data);
  }

  bool get isConnected => _socket.connected;
}
