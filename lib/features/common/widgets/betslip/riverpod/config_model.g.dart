// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemBetConfig _$SystemBetConfigFromJson(Map<String, dynamic> json) =>
    SystemBetConfig(
      id: $enumDecode(_$SystemBetTypeEnumMap, json['id']),
      combination: (json['combination'] as List<dynamic>)
          .map((e) => $enumDecode(_$BetTypeEnumMap, e))
          .toList(),
      selectedOutcomes: (json['selectedOutcomes'] as num).toInt(),
    );

Map<String, dynamic> _$SystemBetConfigToJson(
  SystemBetConfig instance,
) => <String, dynamic>{
  'id': _$SystemBetTypeEnumMap[instance.id]!,
  'combination': instance.combination.map((e) => _$BetTypeEnumMap[e]!).toList(),
  'selectedOutcomes': instance.selectedOutcomes,
};

const _$SystemBetTypeEnumMap = {
  SystemBetType.trixie: 'trixie',
  SystemBetType.patent: 'patent',
  SystemBetType.yankee: 'yankee',
  SystemBetType.lucky15: 'lucky15',
  SystemBetType.canadian: 'canadian',
  SystemBetType.lucky31: 'lucky31',
  SystemBetType.heinz: 'heinz',
  SystemBetType.lucky63: 'lucky63',
  SystemBetType.superheinz: 'superheinz',
};

const _$BetTypeEnumMap = {
  BetType.unknow: 'unknow',
  BetType.single: 'single',
  BetType.double: 'double',
  BetType.triple: 'triple',
  BetType.four: 'four',
  BetType.five: 'five',
  BetType.six: 'six',
  BetType.seven: 'seven',
  BetType.eight: 'eight',
  BetType.nine: 'nine',
  BetType.ten: 'ten',
  BetType.eleven: 'eleven',
  BetType.twelve: 'twelve',
  BetType.thirtheen: 'thirtheen',
  BetType.fourteen: 'fourteen',
  BetType.fifteen: 'fifteen',
  BetType.sixteen: 'sixteen',
  BetType.seventeen: 'seventeen',
  BetType.eighteen: 'eighteen',
  BetType.nineteen: 'nineteen',
  BetType.twenty: 'twenty',
  BetType.twentyone: 'twentyone',
  BetType.twentytwo: 'twentytwo',
  BetType.twentythree: 'twentythree',
  BetType.twentyfour: 'twentyfour',
  BetType.twentyfive: 'twentyfive',
  BetType.twentysix: 'twentysix',
  BetType.twentyseven: 'twentyseven',
  BetType.twentyeight: 'twentyeight',
  BetType.twentynine: 'twentynine',
  BetType.thirty: 'thirty',
  BetType.thirtyone: 'thirtyone',
  BetType.thirtytwo: 'thirtytwo',
  BetType.thirtythree: 'thirtythree',
  BetType.thirtyfour: 'thirtyfour',
  BetType.thirtyfive: 'thirtyfive',
  BetType.thirtysix: 'thirtysix',
  BetType.thirtyseven: 'thirtyseven',
  BetType.thirtyeight: 'thirtyeight',
  BetType.thirtynine: 'thirtynine',
  BetType.forty: 'forty',
  BetType.fortyone: 'fortyone',
  BetType.fortytwo: 'fortytwo',
  BetType.fortythree: 'fortythree',
  BetType.fortyfour: 'fortyfour',
  BetType.fortyfive: 'fortyfive',
  BetType.fortysix: 'fortysix',
  BetType.fortyseven: 'fortyseven',
  BetType.fortyeight: 'fortyeight',
  BetType.fortynine: 'fortynine',
  BetType.fifty: 'fifty',
};
