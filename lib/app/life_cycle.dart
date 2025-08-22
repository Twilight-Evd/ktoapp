import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/utils/log.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({super.key, required this.child});

  final Widget child;

  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    _listener = AppLifecycleListener(
      onDetach: _onDetach,
      onHide: _onHide,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onResume: _onResume,
      onShow: _onShow,
      onStateChange: _onStateChanged,
      onExitRequested: _onExitRequested,
    );

    super.initState();
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _onDetach() => logger.d('onDetach');
  void _onHide() => logger.d('onHide');
  void _onInactive() => logger.d('onInactive');
  void _onPause() => logger.d('onPause');
  void _onRestart() => logger.d('onRestart');
  void _onResume() => logger.d('onResume');
  void _onShow() => logger.d('onShow');
  void _onStateChanged(AppLifecycleState state) {
    // Track state changes
    logger.d(state);
  }

  Future<AppExitResponse> _onExitRequested() async {
    logger.d(">   exit");
    return AppExitResponse.exit;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
