// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  boCount: (json['boCount'] as num).toInt(),
  englishName: json['englishName'] as String,
  groups: (json['groups'] as List<dynamic>?)
      ?.map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  sport: json['sport'] as String,
  eventCount: (json['eventCount'] as num?)?.toInt(),
  secondsToNextEvent: (json['secondsToNextEvent'] as num?)?.toInt(),
  termKey: json['termKey'] as String?,
  sortOrder: json['sortOrder'] as String?,
);

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'boCount': instance.boCount,
      'englishName': instance.englishName,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
      'sport': instance.sport,
      'eventCount': instance.eventCount,
      'secondsToNextEvent': instance.secondsToNextEvent,
      'termKey': instance.termKey,
      'sortOrder': instance.sortOrder,
    };
