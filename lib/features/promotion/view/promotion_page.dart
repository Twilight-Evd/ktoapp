import 'package:flutter/material.dart';
import '../../common/widgets/category_tabs.dart';
import '../../common/widgets/promotion_card.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CategoryTabs(),
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
