import 'package:flutter/material.dart';

/// 通用分页组件
class PaginatedListView<T> extends StatefulWidget {
  /// 全部数据
  final List<T> items;

  /// 每页多少条
  final int pageSize;

  /// 构建 item UI
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Widget Function(BuildContext context)? headerBuilder;

  /// 自定义分页 UI（比如页码按钮）
  /// 参数：当前页，总页数，onPageChanged(page)
  final Widget Function(
    BuildContext context,
    int currentPage,
    int totalPages,
    void Function(int) onPageChanged,
  )?
  paginationBuilder;

  const PaginatedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.headerBuilder,
    this.pageSize = 10,
    this.paginationBuilder,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final totalPages = (widget.items.length / widget.pageSize).ceil();
    final startIndex = (_currentPage - 1) * widget.pageSize;
    final endIndex = (_currentPage * widget.pageSize).clamp(
      0,
      widget.items.length,
    );
    final currentItems = widget.items.sublist(startIndex, endIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.headerBuilder != null) widget.headerBuilder!(context),
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: currentItems.length,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, currentItems[index]);
            },
          ),
        ),
        widget.paginationBuilder != null
            ? widget.paginationBuilder!(
                context,
                _currentPage,
                totalPages,
                _onPageChanged,
              )
            : _defaultPagination(totalPages),
      ],
    );
  }

  void _onPageChanged(int page) {
    if (page < 1 || page > (widget.items.length / widget.pageSize).ceil())
      return;
    setState(() {
      _currentPage = page;
    });
  }

  /// 默认分页 UI
  Widget _defaultPagination(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: _currentPage > 1
              ? () => _onPageChanged(_currentPage - 1)
              : null,
        ),
        Text('$_currentPage / $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _currentPage < totalPages
              ? () => _onPageChanged(_currentPage + 1)
              : null,
        ),
      ],
    );
  }
}
