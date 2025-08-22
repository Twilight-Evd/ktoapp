import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../app/icons/icon.dart';

class PromotionItem {
  String image;
  String title;
  String? desc;
  List<String> category = [];
  DateTime? date;

  PromotionItem({
    required this.image,
    required this.title,
    this.desc,
    List<String>? category,
    this.date,
  }) : category = category ?? [];
}

class PromotionCard extends StatelessWidget {
  final PromotionItem item;
  const PromotionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Image.asset(item.image), // 模拟展示图
          Container(
            // color: Colors.grey[900],
            color: colorScheme.surface,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    // color: Colors.white,
                    color: colorScheme.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    _Tag(label: "Esportes", color: Color(0xff218afb)),
                    const SizedBox(width: 8),
                    _Tag(label: "Cassino", color: Color(0xff03a700)),
                    if (item.date != null) ...[
                      Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: MyIcon.icon(
                                "flag.svg",
                                width: 14,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text: DateFormat('dd/MM/yyyy').format(item.date!),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
