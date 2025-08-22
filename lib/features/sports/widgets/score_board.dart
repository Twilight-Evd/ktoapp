import 'package:flutter/material.dart';

import '../../../shared/widgets/divider.dart';

class ScoreBoard extends StatelessWidget {
  final String stage; // 比赛阶段，比如 "Segunda parte"
  final String time; // 时间，比如 "53:48"
  final String homeTeam;
  final String awayTeam;
  final List<Widget> topWidgets; // 顶部图标
  final List<int> homeStats; // 主队统计（与 topWidgets 对应）
  final List<int> awayStats; // 客队统计（与 topWidgets 对应）
  final Color backgroundColor;
  final Color textColor;
  final Color highlightBackground; // 高亮背景色
  final Color highlightTextColor;

  const ScoreBoard({
    super.key,
    required this.stage,
    required this.time,
    required this.homeTeam,
    required this.awayTeam,
    required this.topWidgets,
    required this.homeStats,
    required this.awayStats,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.highlightBackground = const Color(0xFF333333),
    this.highlightTextColor = Colors.white,
  }) : assert(homeStats.length == awayStats.length);

  @override
  Widget build(BuildContext context) {
    final columnWidth = _calculateColumnWidth(context);

    return Container(
      color: backgroundColor,
      // padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "$stage • $time",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(), // 左侧留空和球队名对齐
                ...topWidgets.map(
                  (w) => SizedBox(
                    width: columnWidth,
                    child: Center(child: w),
                  ),
                ),
              ],
            ),
          ),
          AutoDivider.horizontal(height: 1),
          const SizedBox(height: 4),
          // 主队数据
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildStatsRow(homeTeam, homeStats, columnWidth),
          ),
          const SizedBox(height: 4),
          // 客队数据
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildStatsRow(awayTeam, awayStats, columnWidth),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  /// 计算列宽：根据最大数字宽度和图标宽度
  double _calculateColumnWidth(BuildContext context) {
    final textPainter = TextPainter(
      text: const TextSpan(text: '88', style: TextStyle(fontSize: 14)),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 4;
  }

  Widget _buildStatsRow(String teamName, List<int> stats, double columnWidth) {
    return Row(
      children: [
        Expanded(
          child: Text(
            teamName,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
        ...List.generate(stats.length, (index) {
          final isLast = index == stats.length - 1;
          return Container(
            width: columnWidth,
            decoration: isLast
                ? BoxDecoration(
                    color: highlightBackground,
                    borderRadius: BorderRadius.circular(2),
                  )
                : null,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Center(
              child: Text(
                stats[index].toString(),
                style: TextStyle(
                  color: isLast ? highlightTextColor : textColor,
                  fontSize: 14,
                  fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
