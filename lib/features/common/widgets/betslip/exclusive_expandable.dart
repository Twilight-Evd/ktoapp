import 'package:flutter/material.dart';

import 'extra_animated.dart';

enum ExclusiveMode { intraComponent, interComponent, both, none }

class ExclusiveController {
  final ValueNotifier<Map<String, bool>> value = ValueNotifier({});

  final ExclusiveMode exclusiveMode;
  final List<int>? exclusiveExtraIndices;

  ExclusiveController({
    this.exclusiveMode = ExclusiveMode.none,
    this.exclusiveExtraIndices,
  });

  void toggle(int rowIndex, int extraIndex, int totalExtra) {
    final map = Map<String, bool>.from(value.value);
    final key = "$rowIndex-$extraIndex";

    if (exclusiveMode == ExclusiveMode.intraComponent ||
        exclusiveMode == ExclusiveMode.both) {
      final indices =
          exclusiveExtraIndices ?? List.generate(totalExtra, (i) => i);
      if (indices.contains(extraIndex)) {
        for (int i in indices) {
          map["$rowIndex-$i"] = (i == extraIndex)
              ? !(map["$rowIndex-$i"] ?? false)
              : false;
        }
      } else {
        map[key] = !(map[key] ?? false);
      }
    } else {
      map[key] = !(map[key] ?? false);
    }

    if (exclusiveMode == ExclusiveMode.interComponent ||
        exclusiveMode == ExclusiveMode.both) {
      for (var k in map.keys) {
        final parts = k.split('-');
        final r = int.parse(parts[0]);
        if (r != rowIndex) {
          if (exclusiveMode == ExclusiveMode.both) {
            map[k] = false;
          } else {
            final e = int.parse(parts[1]);
            if (e == extraIndex) map[k] = false;
          }
        }
      }
    }

    value.value = map;
  }
}

class ExclusiveExpandable extends StatefulWidget {
  final Widget child;
  final List<Widget> extraChildren;
  final int rowIndex;
  final ExclusiveController controller;

  const ExclusiveExpandable({
    super.key,
    required this.child,
    required this.extraChildren,
    required this.rowIndex,
    required this.controller,
  });

  @override
  State<ExclusiveExpandable> createState() => _ExclusiveExpandableState();
}

class _ExclusiveExpandableState extends State<ExclusiveExpandable>
    with TickerProviderStateMixin {
  late final List<AnimationController?> _controllers;
  late final List<Animation<double>?> _anims;

  @override
  void initState() {
    super.initState();
    _controllers = List.filled(widget.extraChildren.length, null);
    _anims = List.filled(widget.extraChildren.length, null);

    widget.controller.value.addListener(_handleController);
  }

  @override
  void dispose() {
    widget.controller.value.removeListener(_handleController);
    for (final c in _controllers) {
      c?.dispose();
    }
    super.dispose();
  }

  AnimationController _ensureController(int i) {
    if (_controllers[i] == null) {
      final c = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 250),
      );
      _controllers[i] = c;
      _anims[i] = CurvedAnimation(
        parent: c,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
    }
    return _controllers[i]!;
  }

  Animation<double> _ensureAnim(int i) {
    _ensureController(i);
    return _anims[i]!;
  }

  void _handleController() {
    final map = widget.controller.value.value;
    for (int i = 0; i < widget.extraChildren.length; i++) {
      final key = "${widget.rowIndex}-$i";
      final controller = _controllers[i] ?? _ensureController(i);
      if (map[key] ?? false) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, bool>>(
      valueListenable: widget.controller.value,
      builder: (context, map, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.child,
            for (int i = 0; i < widget.extraChildren.length; i++)
              _buildExtra(i, map),
          ],
        );
      },
    );
  }

  Widget _buildExtra(int i, Map<String, bool> map) {
    final anim = _anims[i] ?? _ensureAnim(i);
    final key = "${widget.rowIndex}-$i";
    final isShow = map[key] ?? false;

    if (!isShow && anim.value == 0) return const SizedBox.shrink();

    return ExtraAnimated(animation: anim, child: widget.extraChildren[i]);
  }
}

// class _ExtraAnimated extends StatelessWidget {
//   final Animation<double> anim;
//   final Widget child;
//   const _ExtraAnimated(this.anim, {required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: anim,
//       builder: (context, child) {
//         final v = anim.value;
//         return ClipRect(
//           child: Align(
//             alignment: Alignment.center,
//             heightFactor: v,
//             child: Opacity(
//               opacity: v,
//               child: Transform.translate(
//                 offset: Offset(0, (1 - v) * -30),
//                 child: Transform.scale(scale: 0.95 + (v * 0.05), child: child),
//               ),
//             ),
//           ),
//         );
//       },
//       child: child,
//     );
//   }
// }
