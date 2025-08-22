import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../../app/icons/icon.dart';
import 'paginated_listview.dart';
import 'riverpod/selection_model.dart';

class CombinationDetail extends StatelessWidget {
  final List<List<int>> combos;
  final List<Selection> selections;

  const CombinationDetail({
    super.key,
    required this.combos,
    required this.selections,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.theme.dividerColor, width: 0.5),
          bottom: BorderSide(color: context.theme.dividerColor, width: 0.5),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PaginatedListView(
        items: combos,
        headerBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Apostas",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cotações (Odds)",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        itemBuilder: (context, item) {
          final comboStr = item.map((i) => (i + 1).toString()).join(",");
          double comboOdds = 1;
          for (var i in item) {
            comboOdds *= selections[i].odds;
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comboStr,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  comboOdds.toStringAsFixed(2),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        paginationBuilder: (context, currentPage, totalPages, onPageChanged) {
          if (totalPages <= 1) return SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                totalPages > 1
                    ? GestureDetector(
                        onTap: currentPage > 1
                            ? () => onPageChanged(currentPage - 1)
                            : null,
                        child: MyIcon.iconSystem(
                          "chevron__left.svg",
                          width: 24,
                          color: colorScheme.onSurface,
                        ),
                      )
                    : SizedBox.shrink(),
                Text(
                  "$currentPage / $totalPages",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                totalPages > 1
                    ? GestureDetector(
                        onTap: currentPage < totalPages
                            ? () => onPageChanged(currentPage + 1)
                            : null,
                        child: MyIcon.iconSystem(
                          "chevron__right.svg",
                          width: 24,
                          color: colorScheme.onSurface,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
