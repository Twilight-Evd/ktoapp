import 'package:flutter/material.dart';

class AnimBundle<T> {
  final AnimationController controller;
  final Animation<T> animation;

  AnimBundle({required this.controller, required this.animation});
}

class AnimationManager with ChangeNotifier {
  final TickerProvider vsync;
  final Map<String, dynamic> _animations = {};

  AnimationManager(this.vsync);

  AnimBundle<T> register<T>({
    required String key,
    required Duration duration,
    required Animatable<T> tween,
    Curve curve = Curves.linear,
  }) {
    if (_animations.containsKey(key)) {
      throw Exception("Animation with key '$key' already exists");
    }

    final controller = AnimationController(vsync: vsync, duration: duration);
    final animation = tween.animate(
      CurvedAnimation(parent: controller, curve: curve),
    );

    final bundle = AnimBundle<T>(controller: controller, animation: animation);
    _animations[key] = bundle;
    return bundle;
  }

  AnimBundle<T>? get<T>(String key) {
    return _animations[key] as AnimBundle<T>?;
  }

  AnimationController? controllerOf(String key) {
    final bundle = _animations[key];
    if (bundle is AnimBundle) return bundle.controller;
    return null;
  }

  AnimationStatus? statusOf(String key) {
    final controller = controllerOf(key);
    return controller?.status;
  }

  Future<void> forward(String key, {double from = 0.0}) async {
    final c = controllerOf(key);
    if (c != null) await c.forward(from: from);
  }

  Future<void> reverse(String key, {double? from}) async {
    final c = controllerOf(key);
    if (c != null) await c.reverse(from: from);
  }

  void repeat(
    String key, {
    double? min,
    double? max,
    bool reverse = false,
    Duration? period,
  }) {
    final c = controllerOf(key);
    c?.repeat(min: min, max: max, reverse: reverse, period: period);
  }

  void stop(String key, {bool canceled = true}) {
    final c = controllerOf(key);
    c?.stop(canceled: canceled);
  }

  void reset(String key) {
    final c = controllerOf(key);
    c?.reset();
  }

  /// 一次性播放（正向到结束）
  Future<void> play(String key) async {
    final c = controllerOf(key);
    if (c != null) {
      await c.forward(from: 0);
      await c.reverse();
    }
  }

  Future<void> forwardAll({double from = 0.0}) async {
    for (final key in _animations.keys) {
      await forward(key, from: from);
    }
  }

  void disposeAll() {
    for (final bundle in _animations.values) {
      if (bundle is AnimBundle) {
        bundle.controller.dispose();
      }
    }
    _animations.clear();
  }
}
