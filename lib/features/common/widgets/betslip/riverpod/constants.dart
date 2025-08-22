import 'config_model.dart';

class BetslipConfig {
  static const int maxSelections = 30;

  static const List<SystemBetConfig> systemBetConfigs = [
    SystemBetConfig(
      id: SystemBetType.trixie,
      combination: [BetType.double, BetType.triple],
      selectedOutcomes: 3,
    ),
    SystemBetConfig(
      id: SystemBetType.patent,
      combination: [BetType.single, BetType.double, BetType.triple],
      selectedOutcomes: 3,
    ),
    SystemBetConfig(
      id: SystemBetType.yankee,
      combination: [BetType.double, BetType.triple, BetType.four],
      selectedOutcomes: 4,
    ),
    SystemBetConfig(
      id: SystemBetType.lucky15,
      combination: [
        BetType.single,
        BetType.double,
        BetType.triple,
        BetType.four,
      ],
      selectedOutcomes: 4,
    ),
    SystemBetConfig(
      id: SystemBetType.canadian,
      combination: [BetType.double, BetType.triple, BetType.four, BetType.five],
      selectedOutcomes: 5,
    ),
    SystemBetConfig(
      id: SystemBetType.lucky31,
      combination: [
        BetType.single,
        BetType.double,
        BetType.triple,
        BetType.four,
        BetType.five,
      ],
      selectedOutcomes: 5,
    ),
    SystemBetConfig(
      id: SystemBetType.heinz,
      combination: [
        BetType.double,
        BetType.triple,
        BetType.four,
        BetType.five,
        BetType.six,
      ],
      selectedOutcomes: 6,
    ),
    SystemBetConfig(
      id: SystemBetType.lucky63,
      combination: [
        BetType.single,
        BetType.double,
        BetType.triple,
        BetType.four,
        BetType.five,
        BetType.six,
      ],
      selectedOutcomes: 6,
    ),
    SystemBetConfig(
      id: SystemBetType.superheinz,
      combination: [
        BetType.double,
        BetType.triple,
        BetType.four,
        BetType.five,
        BetType.six,
        BetType.seven,
      ],
      selectedOutcomes: 7,
    ),
  ];
}
