import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ktoapp/app/themes/theme.dart';
import 'package:ktoapp/shared/extensions/text_editing_controller.dart';

import '../../../../app/icons/icon.dart';
import '../../../../shared/widgets/divider.dart';
import '../../../../shared/widgets/icon_label.dart';
import '../../../../shared/widgets/textfield.dart';
import '../../../../shared/widgets/triangle.dart';
import '../keyboard.dart';
import 'exclusive_expandable.dart';
import 'riverpod/betslip_notifier.dart';
import 'riverpod/selection_model.dart';

extension ListIndexCheck<T> on List<T> {
  bool exists(int i) => i >= 0 && i < length;
}

class BetslipSelection extends StatefulWidget {
  final List<Selection> selections;
  final bool showTextField;
  final void Function(String id) onDelete;
  const BetslipSelection({
    super.key,
    required this.selections,
    required this.onDelete,
    this.showTextField = true,
  });

  @override
  State<BetslipSelection> createState() => _BetslipListState();
}

class _BetslipListState extends State<BetslipSelection>
    with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Selection> _items;

  late final List<TextEditingController> _controllers;

  final controller = ExclusiveController(
    exclusiveMode: ExclusiveMode.interComponent,
  );

  @override
  void initState() {
    super.initState();

    _items = List.from(widget.selections);

    _controllers = List.generate(
      widget.selections.length,
      (index) => TextEditingController(text: ""),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void removeItemAt(int index) {
    final removedItem = _items[index];

    _listKey.currentState?.removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: _buildItem(removedItem, index: index),
      );
    }, duration: const Duration(milliseconds: 300));
    _items.removeAt(index);

    _controllers[index].dispose();
    _controllers.removeAt(index);
  }

  void insertItemAt(int index, Selection newItem) {
    _items.insert(index, newItem);
    _listKey.currentState?.insertItem(
      index,
      duration: const Duration(milliseconds: 300),
    );

    _controllers.add(TextEditingController());
  }

  @override
  void didUpdateWidget(BetslipSelection oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newItems = widget.selections
        .where((e) => !_items.contains(e))
        .toList();
    for (var item in newItems) {
      final index = widget.selections.indexOf(item);
      insertItemAt(index, item);
    }
    final removedItems = _items
        .where((e) => !widget.selections.contains(e))
        .toList();
    for (var item in removedItems) {
      final index = _items.indexOf(item);
      removeItemAt(index);
    }
  }

  Widget _buildMatchCard(
    BuildContext context, {
    required Selection selection,
    required int index,
    Function? onChanged,
    Function? onDelete,
    Function? onFocus,
  }) {
    final colorScheme = context.theme.colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onDelete?.call(selection.id),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyIcon.iconSystem(
                "close.svg",
                color: colorScheme.onSurface,
                width: 24,
              ),
            ),
          ),
          AutoDivider.vertical(width: 0.5, thickness: 2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithLabel(
                        padding: EdgeInsets.all(0),
                        iconWidget: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            "AO VOVO",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        text: selection.name,
                        textStyle: TextStyle(
                          // color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconWithLabel(
                        padding: EdgeInsets.all(0),
                        iconWidget: CustomPaint(
                          size: const Size(10, 8),
                          painter: TrianglePainter(
                            isUp: false,
                            color: Color(0xff00934b),
                          ),
                        ),
                        text: selection.odds.toString(),
                        textStyle: TextStyle(
                          color: Color(0xfff4d864),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (hasWinLabel)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: IconWithLabel(
                          iconWidget: MyIcon.iconSystem(
                            "early_payout.svg",
                            color: Colors.black,
                            width: 12,
                          ),
                          text: "Win Early Payout",
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                      ),
                      Spacer(),
                      if (widget.showTextField)
                        SizedBox(
                          width: 80,
                          child: CustomFormTextField(
                            onTap: () => onFocus?.call(),
                            controller: _controllers.exists(index)
                                ? _controllers.elementAt(index)
                                : null,
                            maxLines: 1,
                            readOnly: true,
                            validator: (value) {},
                            hintText: 'R\$0.00',
                          ),
                        ),
                    ],
                  ),
                  if (!widget.showTextField) SizedBox(height: 5),
                  Text(
                    selection.criterion.label,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${selection.event.homeName} - ${selection.event.awayName}",
                    style: TextStyle(
                      color: Color(0xfff4d864),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    Selection item, {
    BetSlipNotifier? notifier,
    required int index,
    bool? end,
  }) {
    final card = _buildMatchCard(
      context,
      index: index,
      selection: item,
      onDelete: widget.onDelete,

      onFocus: () {
        if (widget.showTextField) controller.toggle(index, 0, 1);
      },
    );
    return Column(
      children: [
        AutoDivider.horizontal(height: 1),
        widget.showTextField
            ? ExclusiveExpandable(
                rowIndex: index,
                controller: controller,
                extraChildren: [
                  NumberKeyboard(
                    margin: EdgeInsets.only(top: 5),
                    onKeyPressed: (key) {
                      _controllers[index].text += key;
                      _controllers[index].validate(
                        maxValue: 1000,
                        decimalPlaces: 2,
                      );
                      final validNum =
                          double.tryParse(_controllers[index].text) ?? 0;
                      notifier?.updateSingleStake(index, validNum);
                    },
                    onDelete: () {
                      if (_controllers[index].text.isNotEmpty) {
                        _controllers[index].text = _controllers[index].text
                            .substring(0, _controllers[index].text.length - 1);
                        _controllers[index].validate(
                          maxValue: 1000,
                          decimalPlaces: 2,
                        );
                      }
                      final validNum =
                          double.tryParse(_controllers[index].text) ?? 0;
                      notifier?.updateSingleStake(index, validNum);
                    },
                    onOk: () => controller.toggle(index, 0, 1),
                  ),
                ],
                child: card,
              )
            : card,
        if (end == true) AutoDivider.horizontal(height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final len = _items.length;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final notifier = ref.read(betSlipProvider.notifier);
        return AnimatedList(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          key: _listKey,
          initialItemCount: len,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: _buildItem(
                _items[index],
                index: index,
                notifier: notifier,
                end: (len - 1) == index,
              ),
            );
          },
        );
      },
    );
  }
}
