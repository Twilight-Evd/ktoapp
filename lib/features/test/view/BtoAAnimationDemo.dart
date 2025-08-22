import 'package:flutter/material.dart';

import 'tran.dart';

class BtoAAnimationDemo extends StatefulWidget {
  const BtoAAnimationDemo({super.key});

  @override
  State<BtoAAnimationDemo> createState() => _BtoAAnimationDemoState();
}

class _BtoAAnimationDemoState extends State<BtoAAnimationDemo>
    with SingleTickerProviderStateMixin {
  bool isA = false;
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<Offset> _position;

  bool isSmall = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scale = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _position = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 1), // 右下角偏移，相对 Stack
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggle() {
    setState(() {
      isA = !isA;
      if (isA) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildB() {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Text(
          "B",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget buildA() {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Text(
          "A",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(body: GeniePage());
  }
}
