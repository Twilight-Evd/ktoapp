import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isTop;

  const GameCard({
    required this.image,
    required this.title,
    required this.subtitle,
    this.isTop = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  Image(image: AssetImage(image)),
                  if (isTop)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfffad749),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          'TOP',
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.orange, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
