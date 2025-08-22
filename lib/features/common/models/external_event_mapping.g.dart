// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_event_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalEventMapping _$ExternalEventMappingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ExternalEventMapping', json, ($checkedConvert) {
  final val = ExternalEventMapping(
    externalId: $checkedConvert('externalId', (v) => (v as num).toInt()),
    eventId: $checkedConvert('eventId', (v) => (v as num).toInt()),
    externalProvider: $checkedConvert('externalProvider', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ExternalEventMappingToJson(
  ExternalEventMapping instance,
) => <String, dynamic>{
  'externalId': instance.externalId,
  'eventId': instance.eventId,
  'externalProvider': instance.externalProvider,
};
