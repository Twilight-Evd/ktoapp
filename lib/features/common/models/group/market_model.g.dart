// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketModel _$MarketModelFromJson(Map<String, dynamic> json) => MarketModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  order: (json['order'] as num).toInt(),
  link: json['link'] as String,
  type: json['type'] as String,
  eventCount: (json['eventCount'] as num).toInt(),
  isLive: json['isLive'] as bool,
);

Map<String, dynamic> _$MarketModelToJson(MarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
      'link': instance.link,
      'type': instance.type,
      'eventCount': instance.eventCount,
      'isLive': instance.isLive,
    };
