import 'betslip_calculator.dart';
import 'config_model.dart';
import 'constants.dart';
import 'selection_model.dart';

class BetSlipState {
  final List<Selection> selections;
  final List<Stake> stakes;
  final BetslipType activeTab;
  final bool? isExpanded;

  final bool miniMode;
  final bool? isMini;

  BetSlipState({
    this.selections = const [],
    this.stakes = const [],
    this.activeTab = BetslipType.none,
    this.isExpanded,
    this.miniMode = false,
    this.isMini,
  });

  BetSlipState copyWith({
    List<Selection>? selections,
    List<Stake>? stakes,
    BetslipType? activeTab,
    bool? isExpanded,
    bool? miniMode,
    bool? isMini,
  }) {
    return BetSlipState(
      selections: selections ?? this.selections,
      stakes: stakes ?? this.stakes,
      activeTab: activeTab ?? this.activeTab,
      isExpanded: isExpanded ?? this.isExpanded,
      miniMode: miniMode ?? this.miniMode,
      isMini: isMini ?? this.isMini,
    );
  }

  bool get hasSameMatch {
    final matchIds = selections.map((s) => s.matchId).toSet();
    return matchIds.length < selections.length;
  }

  BetSlipTotal get singleTotal {
    double totalStake = 0, totalPayout = 0;
    selections.asMap().forEach((idx, s) {
      double stake = stakes
          .firstWhere(
            (e) => e.type == BetslipType.singles && e.key == idx,
            orElse: () => Stake.none(BetslipType.singles),
          )
          .stake;
      totalStake += stake;
      totalPayout += stake * s.odds;
    });
    return BetSlipTotal(totalPayout: totalPayout, totalStake: totalStake);
  }

  BetSlipTotal get combinationTotal {
    final n = selections.length;
    final combos = BetslipCalculator.generateCombinations(n, n);
    double totalOdds = 0;
    for (var c in combos) {
      double odds = 1;
      for (var i in c) {
        odds *= selections[i].odds;
      }
      totalOdds += odds;
    }

    double totalStake = stakes
        .firstWhere(
          (e) => e.type == BetslipType.combination && e.key == n,
          orElse: () => Stake.none(BetslipType.singles),
        )
        .stake;

    return BetSlipTotal(
      totalPayout: totalStake * totalOdds,
      totalStake: totalStake,
      totalOdds: totalOdds,
    );
  }

  BetSlipTotal get systemCombinationTotal {
    final n = selections.length;

    double totalStake = 0, totalOdds = 0, totalPayout = 0;

    stakes.where((e) => e.type == BetslipType.system).forEach((k) {
      if (k.system == true) {
        final betType = SystemBetType.fromIndex(k.key);
        if (betType == null) return;

        final sysDef = BetslipConfig.systemBetConfigs
            .where((d) => d.id == betType)
            .firstOrNull;

        if (sysDef == null) return;

        final ks = sysDef.combination;
        final combos = <List<int>>[];
        for (var kfold in ks) {
          combos.addAll(BetslipCalculator.generateCombinations(n, kfold.index));
        }
        double systemTotalOdds = 0;
        for (var c in combos) {
          double odds = 1;
          for (var i in c) {
            odds *= selections[i].odds;
          }
          systemTotalOdds += odds;
        }
        totalStake += k.stake * combos.length;
        totalPayout += totalStake * totalOdds;

        totalOdds += systemTotalOdds;
      } else {
        int fold = k.key;
        final combos = BetslipCalculator.generateCombinations(n, fold);
        double baseTotalOdds = 0;
        for (var c in combos) {
          double odds = 1;
          for (var i in c) {
            odds *= selections[i].odds;
          }
          baseTotalOdds += odds;
        }
        totalStake += k.stake * combos.length;
        totalPayout += totalStake * baseTotalOdds;
        totalOdds += baseTotalOdds;
      }
    });
    return BetSlipTotal(
      totalPayout: totalPayout,
      totalStake: totalStake,
      totalOdds: totalOdds,
    );
  }
}

class BetSlipTotal {
  final double totalStake;
  final double totalPayout;
  final double? totalOdds;
  const BetSlipTotal({
    required this.totalPayout,
    required this.totalStake,
    this.totalOdds,
  });

  @override
  String toString() {
    return "totalStake:$totalStake,totalPayout:$totalPayout,totalOdds:$totalOdds";
  }
}

class Stake {
  final BetslipType type;
  final int key;
  final bool? system;
  double stake;

  factory Stake.none(BetslipType type) {
    return Stake(type: type, key: 0);
  }
  Stake({required this.type, required this.key, this.system, this.stake = 0});

  @override
  String toString() {
    return "type:$type,key:$key,system:$system,stake:$stake";
  }
}
