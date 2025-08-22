import 'package:json_annotation/json_annotation.dart';

import '../../../../../app/langs/strings.g.dart';

part 'config_model.g.dart';

enum BetType {
  unknow("Unknow"),
  single("Single"),
  double("Double"),
  triple("Triple"),
  four("Four"),
  five("Five"),
  six("Six"),
  seven("Seven"),
  eight("Eight"),
  nine("Nine"),
  ten("Ten"),
  eleven("Eleven"),
  twelve("Twelve"),
  thirtheen("Thirtheen"),
  fourteen("Fourteen"),
  fifteen("Fifteen"),
  sixteen("Sixteen"),
  seventeen("Seventeen"),
  eighteen("Eighteen"),
  nineteen("Nineteen"),
  twenty("Twenty"),
  twentyone("TwentyOne"),
  twentytwo("TwentyTwo"),
  twentythree("TwentyThree"),
  twentyfour("TwentyFour"),
  twentyfive("TwentyFive"),
  twentysix("TwentySix"),
  twentyseven("TwentySeven"),
  twentyeight("TwentyEight"),
  twentynine("TwentyNine"),
  thirty("Thirty"),
  thirtyone("ThirtyOne"),
  thirtytwo("ThirtyTwo"),
  thirtythree("ThirtyThree"),
  thirtyfour("ThirtyFour"),
  thirtyfive("ThirtyFive"),
  thirtysix("ThirtySix"),
  thirtyseven("ThirtySeven"),
  thirtyeight("ThirtyEight"),
  thirtynine("ThirtyNine"),
  forty("Forty"),
  fortyone("FortyOne"),
  fortytwo("FortyTwo"),
  fortythree("FortyThree"),
  fortyfour("FortyFour"),
  fortyfive("FortyFive"),
  fortysix("FortySix"),
  fortyseven("FortySeven"),
  fortyeight("FortyEight"),
  fortynine("FortyNine"),
  fifty("Fifty");

  final String key;

  const BetType(this.key);

  static BetType? fromIndex(int index) => BetType.values.elementAt(index);

  String get label {
    if (key == "") {
      return "";
    }
    return t.betslip.combination["size$key"] ?? "";
  }
}

enum SystemCombinationType {
  unknow(""),
  singles("Singles"),
  doubles("Doubles"),
  triples("Triples"),
  fours("Fours"),
  fives("Fives"),
  sixs("Sixs"),
  sevens("Sevens"),
  eights("Eights"),
  nines("Nines"),
  tens("Tens"),
  elevens("Elevens"),
  twelves("Twelves");

  final String key;

  const SystemCombinationType(this.key);

  String get label {
    if (key == "") {
      return "";
    }
    return t.betslip.combination["size$key"] ?? "";
  }
}

enum SystemBetType {
  trixie,
  patent,
  yankee,
  lucky15,
  canadian,
  lucky31,
  heinz,
  lucky63,
  superheinz;

  static SystemBetType? fromIndex(int index) =>
      SystemBetType.values.elementAt(index);

  String get label {
    return t.betslip.systems.betPackage[name] ?? "";
  }
}

@JsonSerializable()
class SystemBetConfig {
  final SystemBetType id;
  final List<BetType> combination;
  final int selectedOutcomes;

  const SystemBetConfig({
    required this.id,
    required this.combination,
    required this.selectedOutcomes,
  });

  factory SystemBetConfig.fromJson(Map<String, dynamic> json) =>
      _$SystemBetConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SystemBetConfigToJson(this);
}

enum BetslipType {
  none(0, ""),
  singles(1, "Single"),
  combination(2, "Combination"),
  system(3, "System");

  final int code;
  final String key;

  const BetslipType(this.code, this.key);

  static BetslipType? fromCode(int code) => BetslipType.values.firstWhere(
    (e) => e.code == code,
    orElse: () => BetslipType.none,
  );

  String get label {
    if (key == "") {
      return t.betslip.combination["sizeSingle"] ?? "";
    }
    return t.betslip.combination["size$key"] ?? "";
  }
}
