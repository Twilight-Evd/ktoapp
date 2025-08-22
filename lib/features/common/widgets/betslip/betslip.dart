import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ktoapp/app/themes/theme.dart';
import 'package:ktoapp/core/utils/log.dart';
import 'package:ktoapp/features/common/widgets/betslip/betslip_selection.dart';
import 'package:ktoapp/features/common/widgets/betslip/extra_animated.dart';
import 'package:ktoapp/features/common/widgets/betslip/riverpod/config_model.dart';
import 'package:ktoapp/shared/widgets/animation.dart';

import '../../../../app/icons/icon.dart';
import '../../../../app/langs/strings.g.dart';
import '../../../../shared/widgets/animation_manager.dart';
import '../../../../shared/widgets/bottom_sheet.dart';
import '../../../../shared/widgets/divider.dart';
import 'betslip_combination.dart';
import 'betslip_tips.dart';
import 'riverpod/betslip_calculator.dart';
import 'riverpod/betslip_notifier.dart';
import 'riverpod/betslip_state.dart';
import 'riverpod/constants.dart';

void showBettingBottomSheet(BuildContext context) {
  NonModalBottomSheet.show(context, child: BetslipBottomSheet());
}

class BetslipBottomSheet extends ConsumerStatefulWidget {
  const BetslipBottomSheet({super.key});

  @override
  ConsumerState<BetslipBottomSheet> createState() =>
      _SportsScoreBottomSheetState();
}

class _SportsScoreBottomSheetState extends ConsumerState<BetslipBottomSheet>
    with TickerProviderStateMixin {
  late AnimationManager _animManager;
  bool lastIsExpanded = true;

  @override
  void initState() {
    super.initState();

    _animManager = AnimationManager(this);

    _animManager.register<double>(
      key: "shake",
      duration: const Duration(milliseconds: 400),
      tween: MyAnimation.shakeAnimation,
    );

    _animManager
            .register<Color?>(
              key: "color",
              duration: const Duration(milliseconds: 1000),
              tween: ColorTween(begin: Colors.grey, end: Color(0xff322b0f)),
            )
            .controller
            .value =
        1;
  }

  @override
  void dispose() {
    _animManager.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final betslip = ref.watch(betSlipProvider);
    final notifier = ref.read(betSlipProvider.notifier);

    ref.listen<int>(betSlipProvider.select((e) => e.selections.length), (
      previous,
      next,
    ) {
      if (next > (previous ?? 0)) {
        if (lastIsExpanded == false && betslip.isExpanded == false) {
          _animManager.forward("shake");
        }
      } else if (next < (previous ?? 0)) {
        if (lastIsExpanded == false && betslip.isExpanded == false) {
          _animManager.forward("color");
        }
      }
    });

    lastIsExpanded = betslip.isExpanded ?? true;

    final shakeAnim = _animManager.get<double>("shake");
    final colorAnim = _animManager.get("color");
    final colorScheme = context.theme.colorScheme;
    return betslip.miniMode && betslip.isMini == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  notifier.updateMini(isMini: false, isExpanded: true);
                  NonModalBottomSheet.updateBottom(0);
                },
                child: AnimatedBuilder(
                  animation:
                      shakeAnim?.animation ?? const AlwaysStoppedAnimation(0.0),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, shakeAnim?.animation.value ?? 0),
                      child: child,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xfffad749),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${betslip.selections.length}',
                      style: const TextStyle(
                        color: Color(0xff322b0f),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            padding: EdgeInsets.only(
              bottom: betslip.miniMode == true
                  ? (NonModalBottomSheet.initBottom ?? 0) / 2
                  : 0,
            ),
            color: colorScheme.secondaryContainer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top header
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (betslip.miniMode) {
                      notifier.updateMini(
                        isMini: true,
                        isExpanded: betslip.isExpanded ?? false,
                      );
                      NonModalBottomSheet.resetBottom();
                    } else {
                      notifier.toggleExpend();
                    }
                  },
                  child: AnimatedBuilder(
                    animation:
                        shakeAnim?.animation ??
                        const AlwaysStoppedAnimation(0.0),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, shakeAnim?.animation.value ?? 0),
                        child: child,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xfffad749),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedBuilder(
                            animation:
                                colorAnim?.animation ??
                                const AlwaysStoppedAnimation(0.0),
                            builder: (context, child) {
                              return Text(
                                '${betslip.activeTab.label} (${betslip.selections.length}) ',
                                style: TextStyle(
                                  color: colorAnim?.animation.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                          ),
                          MyIcon.iconSystem(
                            (betslip.isExpanded == null ||
                                    betslip.isExpanded == true)
                                ? "minimize.svg"
                                : "maximize.svg",
                            color: const Color(0xff322b0f),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ExtraAnimated(
                  isExpanded: betslip.isExpanded != false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (betslip.activeTab.index > 0) ...[
                        Row(
                          children: BetslipType.values
                              .where((e) => e != BetslipType.none)
                              .map(
                                (e) => _buildTab(context, e, betslip, notifier),
                              )
                              .toList(),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                notifier.clearSelections();
                              },
                              child: Text(
                                'Limpar o cupom de apostas',
                                style: TextStyle(
                                  color: colorScheme.onSurface,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                      Container(
                        color: colorScheme.surface,
                        child: BetslipSelection(
                          selections: betslip.selections,
                          showTextField: betslip.activeTab.index <= 1,
                          onDelete: (id) {
                            notifier.removeSelection(id);
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              axisAlignment: 0.0, // 从上收起/展开
                              child: child,
                            ),
                          );
                        },
                        child: KeyedSubtree(
                          key: ValueKey(
                            betslip.activeTab,
                          ), // 保证每个 tab 是不同的 child
                          child: _buildBettingOptions(betslip, notifier),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildTab(
    BuildContext context,
    BetslipType tab,
    BetSlipState betslip,
    BetSlipNotifier notifier,
  ) {
    final colorScheme = context.theme.colorScheme;
    final isSelected = betslip.activeTab == tab;
    bool disabled = false;
    if (tab == BetslipType.system && betslip.selections.length > 12) {
      disabled = true;
    }
    return Expanded(
      child: GestureDetector(
        onTap: disabled ? null : () => notifier.setActiveTab(tab),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Color(0xffDA0000) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            tab.label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                .copyWith(
                  decoration: disabled ? TextDecoration.lineThrough : null,
                  color: disabled ? colorScheme.onSurface : null,
                ),
          ),
        ),
      ),
    );
  }

  Widget _placeButton(double? payout) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Possível ganho:', style: TextStyle(fontSize: 12)),
              Text(
                'R\$${payout ?? 0.00}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Apostar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBettingOptions(BetSlipState betslip, BetSlipNotifier notifier) {
    switch (betslip.activeTab) {
      case BetslipType.none:
      case BetslipType.singles:
        return _buildSinglesOptions(betslip, notifier);
      case BetslipType.combination:
        return _buildCombinationOptions(context, betslip, notifier);
      case BetslipType.system:
        return _buildSystemOptions(betslip, notifier);
    }
  }

  Widget _buildSinglesOptions(BetSlipState betslip, BetSlipNotifier notifier) {
    final total = betslip.singleTotal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            children: [
              Text('Aposta total:', style: TextStyle(fontSize: 12)),
              Spacer(),
              Text(
                'R\$ ${total.totalStake}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        _placeButton(total.totalPayout),
      ],
    );
  }

  Widget _buildCombinationOptions(
    BuildContext context,
    BetSlipState betslip,
    BetSlipNotifier notifier,
  ) {
    final colorScheme = context.theme.colorScheme;
    final n = betslip.selections.length;
    final combos = BetslipCalculator.generateCombinations(n, n);
    final total = betslip.combinationTotal;

    Map<BetType, List<List<int>>> combosMap = {};
    combosMap[BetType.fromIndex(n)!] = combos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (betslip.hasSameMatch)
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            color: colorScheme.surface,
            child: BetslipTips(message: t.betslipErrors.notCombinable),
          ),

        BetslipCombination(
          selections: betslip.selections,
          combosList: combosMap.entries.toList(),
          onChanged: (index, stake) {
            notifier.updateCombinationStake(index, stake);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text('Odds totais:', style: TextStyle(fontSize: 12)),
              Spacer(),
              Text(
                '${total.totalOdds}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              'CASH OUT',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        _placeButton(total.totalPayout),
      ],
    );
  }

  Widget _buildSystemOptions(BetSlipState betslip, BetSlipNotifier notifier) {
    final n = betslip.selections.length;
    List<Widget> sysWidgets = [];

    Map<SystemCombinationType, List<List<int>>> combosMap = {};
    for (var sct in SystemCombinationType.values) {
      final k = sct.index;
      if (k > 0 && k <= n) {
        final combos = BetslipCalculator.generateCombinations(n, k);
        combosMap[sct] = combos;
      }
    }

    sysWidgets.add(
      BetslipCombination(
        selections: betslip.selections,
        combosList: combosMap.entries.toList(),
        onChanged: (index, stake) {
          notifier.updateSystemStake(index, stake, false);
        },
      ),
    );

    sysWidgets.add(AutoDivider.horizontal(height: 1));

    Map<SystemBetType, List<List<int>>> systemBetCombosMap = {};
    BetslipConfig.systemBetConfigs
        .where((def) => n == def.selectedOutcomes)
        .forEach((def) {
          final ks = def.combination;
          final combos = <List<int>>[];
          for (var kfold in ks) {
            combos.addAll(
              BetslipCalculator.generateCombinations(n, kfold.index),
            );
          }
          systemBetCombosMap[def.id] = combos;
        });

    sysWidgets.add(
      BetslipCombination(
        selections: betslip.selections,
        combosList: systemBetCombosMap.entries.toList(),
        onChanged: (index, stake) {
          notifier.updateSystemStake(index, stake, true);
        },
      ),
    );

    final total = betslip.systemCombinationTotal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...sysWidgets,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              Text('Aposta total:', style: TextStyle(fontSize: 12)),
              Spacer(),
              Text(
                "${total.totalStake}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        _placeButton(total.totalPayout),
      ],
    );
  }
}
