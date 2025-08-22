import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ktoapp/features/common/widgets/betslip/riverpod/config_model.dart';

import 'betslip_state.dart';
import 'selection_model.dart';

final betSlipProvider = StateNotifierProvider<BetSlipNotifier, BetSlipState>((
  ref,
) {
  return BetSlipNotifier();
});

class BetSlipNotifier extends StateNotifier<BetSlipState> {
  BetSlipNotifier() : super(BetSlipState());

  BetslipType? _autoActiveTab(bool? add) {
    final len = add == true
        ? state.selections.length + 1
        : state.selections.length - 1;
    if (state.activeTab == BetslipType.none) {
      if (len > 1) {
        return BetslipType.combination;
      }
    } else {
      if (len <= 1) {
        return BetslipType.none;
      } else if (len >= SystemCombinationType.values.length &&
          state.activeTab == BetslipType.system) {
        return BetslipType.combination;
      }
    }
    return state.activeTab;
  }

  void toggleSelection(Selection s) {
    if (!state.selections.any((sel) => sel.id == s.id)) {
      state = state.copyWith(
        selections: [...state.selections, s],
        activeTab: _autoActiveTab(true),
      );
    } else {
      removeSelection(s.id);
    }
  }

  void addSelection(Selection s) {
    if (!state.selections.any((sel) => sel.id == s.id)) {
      state = state.copyWith(
        selections: [...state.selections, s],
        activeTab: _autoActiveTab(true),
      );
    }
  }

  void removeSelection(String id) {
    final selections = state.selections.where((s) => s.id != id).toList();
    if (selections.isEmpty) {
      clearSelections();
      return;
    }
    state = state.copyWith(
      selections: selections,
      activeTab: _autoActiveTab(false),
    );
  }

  void clearSelections() {
    state = BetSlipState(
      selections: [],
      stakes: [],
      activeTab: BetslipType.none,
      isExpanded: null,
      isMini: null,
      miniMode: false,
    );
  }

  void updateSingleStake(int index, double stake) {
    _updateStake(BetslipType.singles, index, stake);
  }

  void updateCombinationStake(int index, double stake) {
    _updateStake(BetslipType.combination, index, stake);
  }

  void updateSystemStake(int index, double stake, bool system) {
    _updateStake(BetslipType.system, index, stake, system: system);
  }

  void _updateStake(BetslipType type, int index, double stake, {bool? system}) {
    final newStake = Stake(
      type: type,
      key: index,
      stake: stake,
      system: system,
    );
    final newList = List<Stake>.from(state.stakes);
    final stakeIndex = newList.indexWhere(
      (e) => e.type == type && e.key == index && e.system == system,
    );
    if (stakeIndex < 0) {
      newList.add(newStake);
    } else {
      newList[stakeIndex] = newStake;
    }
    state = state.copyWith(stakes: newList);
  }

  void setActiveTab(BetslipType tab) {
    state = state.copyWith(activeTab: tab);
  }

  void setExpend(bool isExpanded) {
    state = state.copyWith(isExpanded: isExpanded);
  }

  void toggleExpend() {
    state = state.copyWith(
      isExpanded: state.isExpanded == null ? false : !state.isExpanded!,
    );
  }

  void updateMini({bool? miniMode, bool? isMini, bool? isExpanded}) {
    state = state.copyWith(
      miniMode: miniMode,
      isMini: isMini,
      isExpanded: isExpanded,
    );
  }

  void toggleMiniMode() {
    state = state.copyWith(miniMode: !state.miniMode);
  }

  void setMini(bool isMini) {
    state = state.copyWith(isMini: isMini);
  }

  void toggleMini() {
    state = state.copyWith(
      isMini: state.isMini == null ? true : !state.isMini!,
    );
  }
}
