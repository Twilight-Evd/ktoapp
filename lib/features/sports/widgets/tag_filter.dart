import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../common/models/tag_filter_model.dart';

class TagFilter extends StatefulWidget {
  final List<TagFilterModel> tags;
  final int selected;
  final ValueChanged<int>? onSelected;

  const TagFilter({
    super.key,
    required this.tags,
    this.selected = 0,
    this.onSelected,
  });

  @override
  State<TagFilter> createState() => _TagFilterState();
}

class _TagFilterState extends State<TagFilter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tags.length,
      vsync: this,
      initialIndex: widget.selected,
    );
  }

  @override
  void didUpdateWidget(TagFilter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.tags.length != widget.tags.length) {
      _tabController.dispose();
      _tabController = TabController(
        length: widget.tags.length,
        vsync: this,
        initialIndex: widget.selected.clamp(0, widget.tags.length - 1),
      );
    } else if (oldWidget.selected != widget.selected &&
        _tabController.index != widget.selected) {
      _tabController.animateTo(widget.selected);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      widget.onSelected?.call(_tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.colorScheme;
    return Container(
      color: theme.surfaceContainer,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 2,
        ),
        dividerColor: Colors.transparent,
        physics: const BouncingScrollPhysics(),
        onTap: (index) {
          widget.onSelected?.call(index);
        },
        tabs: widget.tags.map((tag) => Tab(child: Text(tag.name))).toList(),
      ),
    );
  }
}
