import 'package:flutter/material.dart';

import '../../../app/icons/icon.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex = 0;

  final List<String> tabs = ['Home', 'Todas as categorias', 'Promoções'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xff323232),
              shape: BoxShape.circle,
            ),
            child: Center(child: MyIcon.icon("search.svg")),
          ),
          const SizedBox(width: 8),
          ...List.generate(tabs.length, (index) {
            final isSelected = selectedIndex == index;
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 3,
                        width: 40,
                        color: isSelected
                            ? Color(0xffda0000)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                if (index != tabs.length - 1) const SizedBox(width: 16),
              ],
            );
          }),
        ],
      ),
    );
  }
}
