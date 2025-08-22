import 'package:json_annotation/json_annotation.dart';

part 'external_event_mapping.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class ExternalEventMapping {
  final int externalId;
  final int eventId;
  final String externalProvider;

  ExternalEventMapping({
    required this.externalId,
    required this.eventId,
    required this.externalProvider,
  });

  factory ExternalEventMapping.fromJson(Map<String, dynamic> json) =>
      _$ExternalEventMappingFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalEventMappingToJson(this);
}

//{"error":{"message":"No results for MATCH  1024584650 is found","status":404}}
class EventMappingResponse {
  final List<ExternalEventMapping> eventMapping;

  EventMappingResponse({required this.eventMapping});

  factory EventMappingResponse.fromJson(Map<String, dynamic> json) {
    return EventMappingResponse(
      eventMapping: (json['eventMapping'] as List)
          .map((e) => ExternalEventMapping.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'eventMapping': eventMapping.map((e) => e.toJson()).toList()};
  }
}
