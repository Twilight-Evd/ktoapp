import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  late final AnimationController _headerController;
  late final AnimationController _cardController;
  late final AnimationController _listController;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _listController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _headerController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _cardController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _listController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardController.dispose();
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FadeSlideIn(controller: _headerController, child: _buildUserHeader()),
          const SizedBox(height: 16),
          FadeSlideIn(
            controller: _cardController,
            child: _buildUserActivityCard(),
          ),
          const SizedBox(height: 16),
          FadeSlideIn(controller: _listController, child: _buildVideoList()),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("IP: 192.168.1.1"),
          ],
        ),
      ],
    );
  }

  Widget _buildUserActivityCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Latest Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Learned Flutter animations today, feeling more powerful! 🔥"),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList() {
    final videos = List.generate(5, (i) => "User Video #${i + 1}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "My Videos",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: videos
              .map(
                (v) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 120,
                    color: Colors.grey[300],
                    child: Center(child: Text(v)),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class FadeSlideIn extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const FadeSlideIn({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    final opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    final offset = Tween(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Opacity(
          opacity: opacity.value,
          child: Transform.translate(offset: offset.value * 100, child: child),
        );
      },
    );
  }
}
