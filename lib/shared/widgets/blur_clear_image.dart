import 'package:flutter/material.dart';

//  BlurToClearImage(
//                 lowResUrl:
//                     'https://user-images.githubusercontent.com/32562337/97818490-b6275500-1cc8-11eb-8d8a-e68eeec64f92.jpg',
//                 highResUrl:
//                     'https://user-images.githubusercontent.com/32562337/97818479-aad42980-1cc8-11eb-8f89-28bc8ac3fd14.jpg',
//               ),

class BlurToClearImage extends StatefulWidget {
  final String lowResUrl;
  final String highResUrl;
  final double width;
  final double height;

  const BlurToClearImage({
    required this.lowResUrl,
    required this.highResUrl,
    this.width = 300,
    this.height = 200,
    super.key,
  });

  @override
  _BlurToClearImageState createState() => _BlurToClearImageState();
}

class _BlurToClearImageState extends State<BlurToClearImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _highResLoaded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHighResImageLoaded() {
    if (!_highResLoaded) {
      _highResLoaded = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Image.network(
            widget.lowResUrl,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final clipHeight = widget.height * _animation.value;
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: clipHeight / widget.height,
                  child: child,
                ),
              );
            },
            child: Image.network(
              widget.highResUrl,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  _onHighResImageLoaded();
                  return child;
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
