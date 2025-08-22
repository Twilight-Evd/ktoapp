// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Selection _$SelectionFromJson(Map<String, dynamic> json) => Selection(
  id: json['id'] as String,
  matchId: json['matchId'] as String,
  name: json['name'] as String,
  odds: (json['odds'] as num).toDouble(),
  market: json['market'] as String,
  event: Event.fromJson(json['event'] as Map<String, dynamic>),
  betOfferType: BetOfferType.fromJson(
    json['betOfferType'] as Map<String, dynamic>,
  ),
  criterion: Criterion.fromJson(json['criterion'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SelectionToJson(Selection instance) => <String, dynamic>{
  'id': instance.id,
  'matchId': instance.matchId,
  'name': instance.name,
  'odds': instance.odds,
  'market': instance.market,
  'event': instance.event,
  'betOfferType': instance.betOfferType,
  'criterion': instance.criterion,
};
