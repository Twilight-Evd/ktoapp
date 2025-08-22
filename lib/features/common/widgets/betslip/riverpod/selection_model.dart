import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/match_model.dart';

part 'selection_model.g.dart';

@JsonSerializable()
class Selection extends Equatable {
  final String id;
  final String matchId;
  final String name;
  final double odds;
  final String market;
  final Event event;
  final BetOfferType betOfferType;
  final Criterion criterion;

  const Selection({
    required this.id,
    required this.matchId,
    required this.name,
    required this.odds,
    required this.market,
    required this.event,
    required this.betOfferType,
    required this.criterion,
  });

  factory Selection.fromJson(Map<String, dynamic> json) =>
      _$SelectionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Selection && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  List<Object?> get props => [id];
}
