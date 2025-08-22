import 'package:json_annotation/json_annotation.dart';

part 'market_model.g.dart';

@JsonSerializable()
class MarketModel {
  final int id;
  final String title;
  final int order;
  final String link;
  final String type;
  final int eventCount;
  final bool isLive;

  MarketModel({
    required this.id,
    required this.title,
    required this.order,
    required this.link,
    required this.type,
    required this.eventCount,
    required this.isLive,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketModelToJson(this);
}
