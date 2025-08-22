import 'package:flutter/material.dart';
import '../../common/widgets/category_tabs.dart';
import '../../common/widgets/promotion_card.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/game_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: BannerCarousel(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: const CategoryTabs(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GameListview(
              item: GameListviewItem(title: "Em alta nas redes"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GameListview(
              item: GameListviewItem(
                title: 'Melhores Jogos',
                desc:
                    "Todos os nossos jogos são ótimos, mas alguns são melhores.Confira os títulos mais bem classificados pela nossa equipe de cassino!",
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PromotionCard(
              item: PromotionItem(
                image: "assets/images/temp/ClubeKTO.png",
                title: "Clube KTO",
                date: DateTime.now(),
              ),
            ),
          ),

          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PromotionCard(
              item: PromotionItem(
                image: "assets/images/temp/Daily-Fortune.png",
                title: "Corrida Diária Fortune",
                date: DateTime.now(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
