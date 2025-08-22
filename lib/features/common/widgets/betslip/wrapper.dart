import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/bottom_sheet.dart';
import 'betslip.dart';
import 'riverpod/betslip_notifier.dart';
import 'riverpod/betslip_state.dart';

class BetslipWrapper extends ConsumerWidget {
  const BetslipWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(betSlipProvider.notifier);
    ref.listen<BetSlipState>(betSlipProvider, (previous, next) {
      final plen = previous?.selections.length, nlen = next.selections.length;
      if (plen != nlen) {
        if (next.selections.isEmpty) {
          NonModalBottomSheet.close();
        } else if (previous?.selections.isEmpty == true) {
          showBettingBottomSheet(context);
        } else {
          if (previous?.isExpanded == null && nlen > plen!) {
            notifier.setExpend(false);
          }
        }
      }
    });
    return SizedBox.shrink();
  }
}
