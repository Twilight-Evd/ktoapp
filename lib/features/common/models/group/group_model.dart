import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupModel {
  final int id;
  final String name;
  final int boCount;
  final String englishName;
  final List<GroupModel>? groups;
  final String sport;
  final int? eventCount;
  final int? secondsToNextEvent;
  final String? termKey;
  final String? sortOrder;

  GroupModel({
    required this.id,
    required this.name,
    required this.boCount,
    required this.englishName,
    this.groups,
    required this.sport,
    this.eventCount,
    this.secondsToNextEvent,
    this.termKey,
    this.sortOrder,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);
}
