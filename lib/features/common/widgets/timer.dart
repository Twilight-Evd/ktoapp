import 'dart:async';
import 'package:flutter/material.dart';

class TimerDisplay extends StatefulWidget {
  final TextStyle? style;
  final int minutes;
  final int seconds;
  const TimerDisplay({
    super.key,
    required this.minutes,
    required this.seconds,
    this.style,
  });

  @override
  State<TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _elapsedSeconds = widget.minutes * 60 + widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get formattedTime {
    final minutes = (_elapsedSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_elapsedSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedTime,
      style:
          widget.style?.copyWith(
            fontFeatures: [FontFeature.tabularFigures()],
          ) ??
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xff00df71),
            fontFeatures: [FontFeature.tabularFigures()],
          ),
    );
  }
}
