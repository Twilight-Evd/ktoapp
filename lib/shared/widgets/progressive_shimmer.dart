import 'package:flutter/material.dart';

class ProgressiveShimmerList<T> extends StatelessWidget {
  final List<T> items;
  final int placeholderCount;
  final Widget Function(T item) itemBuilder;
  final Widget placeholderBuilder;
  final EdgeInsetsGeometry padding;
  final Axis direction;
  final bool useListView;
  final bool loading;
  final bool scroll;
  final double cacheExtent;
  final List<Widget> prefixWidgets;
  final List<Widget> suffixWidgets;

  const ProgressiveShimmerList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.placeholderBuilder,
    this.placeholderCount = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.direction = Axis.vertical,
    this.useListView = true,
    this.loading = false,
    this.scroll = true,
    this.cacheExtent = 250,
    this.prefixWidgets = const [],
    this.suffixWidgets = const [],
  });

  factory ProgressiveShimmerList.listView({
    Key? key,
    required List<T> items,
    required Widget Function(T item) itemBuilder,
    required Widget placeholderBuilder,
    Axis scrollDirection = Axis.vertical,
    int placeholderCount = 6,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    List<Widget> prefixWidgets = const [],
    List<Widget> suffixWidgets = const [],
    bool loading = false,
    bool scroll = true,
    double cacheExtent = 250,
  }) {
    return ProgressiveShimmerList<T>(
      key: key,
      items: items,
      itemBuilder: itemBuilder,
      placeholderBuilder: placeholderBuilder,
      direction: scrollDirection,
      placeholderCount: placeholderCount,
      padding: padding,
      useListView: true,
      prefixWidgets: prefixWidgets,
      suffixWidgets: suffixWidgets,
      loading: loading,
      scroll: scroll,
      cacheExtent: cacheExtent,
    );
  }

  factory ProgressiveShimmerList.flex({
    Key? key,
    required List<T> items,
    required Widget Function(T item) itemBuilder,
    required Widget placeholderBuilder,
    Axis scrollDirection = Axis.vertical,
    int placeholderCount = 6,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    List<Widget> prefixWidgets = const [],
    List<Widget> suffixWidgets = const [],
    bool loading = false,
    bool scroll = true,
  }) {
    return ProgressiveShimmerList<T>(
      key: key,
      items: items,
      itemBuilder: itemBuilder,
      placeholderBuilder: placeholderBuilder,
      direction: scrollDirection,
      placeholderCount: placeholderCount,
      padding: padding,
      useListView: false,
      prefixWidgets: prefixWidgets,
      suffixWidgets: suffixWidgets,
      loading: loading,
      scroll: scroll,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (useListView) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: scroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        scrollDirection: direction,
        cacheExtent: cacheExtent,
        itemCount: _itemCount(),
        itemBuilder: (context, index) {
          return Padding(
            padding: padding,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: _buildItem(index),
            ),
          );
        },
      );
    } else {
      final children = <Widget>[
        ...prefixWidgets,
        for (int i = 0; i < _itemCount(); i++)
          Padding(
            padding: padding,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _buildItem(i),
            ),
          ),
        ...suffixWidgets,
      ];

      final content = Flex(
        direction: direction,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );

      if (!scroll) {
        return content;
      }

      return SingleChildScrollView(scrollDirection: direction, child: content);
    }
  }

  int _itemCount() => loading ? placeholderCount : items.length;

  Widget _buildItem(int index) {
    if (loading) {
      return KeyedSubtree(
        key: ValueKey('placeholder-$index'),
        child: placeholderBuilder,
      );
    } else {
      return KeyedSubtree(
        key: ValueKey('item-$index'),
        child: itemBuilder(items[index]),
      );
    }
  }
}
