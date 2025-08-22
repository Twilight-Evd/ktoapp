import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'game_card.dart';

class GameListviewItem {
  String title;
  String? desc;
  String? toMore;
  GameListviewItem({required this.title, this.desc, this.toMore});
}

class GameListview extends StatelessWidget {
  final GameListviewItem item;

  const GameListview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: TextStyle(
                // color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (item.toMore != null) {
                  context.goNamed(item.toMore!);
                }
              },
              child: Text(
                'Mostrar Tudo',
                style: TextStyle(
                  color: Color(0xffda0000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (item.desc != null) ...[
          const SizedBox(height: 8),
          Text(
            item.desc!,
            style: TextStyle(
              // color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ),
          ),
        ],
        const SizedBox(height: 8),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              GameCard(
                image: 'assets/images/temp/fortune_tigerx.jpg',
                title: 'Fortune Tiger',
                subtitle: 'PG SOFT',
                isTop: true,
              ),
              SizedBox(width: 12),
              GameCard(
                image: 'assets/images/temp/fortune_rabbitx.jpg',
                title: 'Fortune Rabbit',
                subtitle: 'PG SOFT',
                isTop: true,
              ),
              SizedBox(width: 12),
              GameCard(
                image: 'assets/images/temp/fortune_rabbitx.jpg',
                title: 'Fortune Dragon',
                subtitle: 'PG SOFT',
                isTop: true,
              ),
              SizedBox(width: 12),
              GameCard(
                image: 'assets/images/temp/fortune_rabbitx.jpg',
                title: 'Fortune Dragon',
                subtitle: 'PG SOFT',
                isTop: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
