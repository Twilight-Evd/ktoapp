import 'package:flutter/material.dart';
import 'package:ktoapp/features/common/widgets/betslip/betslip_selection.dart';
import 'package:ktoapp/shared/extensions/text_editing_controller.dart';

import '../../../../shared/widgets/textfield.dart';
import '../keyboard.dart';
import 'combination_detail.dart';
import 'exclusive_expandable.dart';
import 'riverpod/selection_model.dart';

class BetslipCombination<T> extends StatefulWidget {
  final List<Selection> selections;
  final List<MapEntry<T, List<List<int>>>> combosList;
  final Function(int, double) onChanged;

  const BetslipCombination({
    super.key,
    required this.selections,
    required this.combosList,
    required this.onChanged,
  });

  @override
  State<BetslipCombination> createState() => _BetslipCombinationState();
}

class _BetslipCombinationState extends State<BetslipCombination>
    with TickerProviderStateMixin {
  List<TextEditingController> _controllers = [];

  final controller = ExclusiveController(
    exclusiveMode: ExclusiveMode.interComponent,
  );

  @override
  void initState() {
    super.initState();
    _rebuildCombosAndControllers();
  }

  @override
  void dispose() {
    _controllers.forEach((e) => e.dispose());
    super.dispose();
  }

  @override
  void didUpdateWidget(BetslipCombination oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selections.length != widget.selections.length) {
      _controllers.forEach((e) => e.dispose());
      _controllers.clear();
      _rebuildCombosAndControllers();
    }
  }

  void _rebuildCombosAndControllers() {
    _controllers = List.generate(
      widget.combosList.length,
      (i) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.combosList.length,
      itemBuilder: (context, index) {
        final entry = widget.combosList[index];
        final sct = entry.key;
        final combos = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ExclusiveExpandable(
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
                  widget.onChanged(sct.index, validNum);
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
                  widget.onChanged(sct.index, validNum);
                },
                onOk: () => controller.toggle(index, 0, 2),
              ),
              CombinationDetail(combos: combos, selections: widget.selections),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => controller.toggle(index, 1, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sct?.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text("${combos.length} x", style: TextStyle(fontSize: 10)),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 80,
                      child: CustomFormTextField(
                        onTap: () => controller.toggle(index, 0, 2),
                        controller: _controllers.exists(index)
                            ? _controllers[index]
                            : null,
                        maxLines: 1,
                        validator: (value) {},
                        hintText: 'R\$0.00',
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
