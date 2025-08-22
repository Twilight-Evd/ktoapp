// match_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class MatchModel {
  final Event event;
  final LiveData? liveData;
  final MainBetOffer? mainBetOffer;

  MatchModel({required this.event, this.liveData, this.mainBetOffer});

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

@JsonSerializable()
class EventPath {
  final int id;
  final String name;
  final String englishName;
  final String termKey;

  EventPath({
    required this.id,
    required this.name,
    required this.englishName,
    required this.termKey,
  });

  factory EventPath.fromJson(Map<String, dynamic> json) =>
      _$EventPathFromJson(json);
  Map<String, dynamic> toJson() => _$EventPathToJson(this);
}

@JsonSerializable(explicitToJson: true, checked: true)
class Event {
  final int id;
  final String name;
  final String englishName;
  final String homeName;
  final String? awayName;
  final String start;
  final String group;
  final int groupId;
  final List<EventPath> path;
  final int? nonLiveBoCount;
  final int? liveBoCount;
  final String sport;
  final List<String> tags;
  final String state;

  Event({
    required this.id,
    required this.name,
    required this.englishName,
    required this.homeName,
    this.awayName,
    required this.start,
    required this.group,
    required this.groupId,
    required this.path,
    this.nonLiveBoCount,
    this.liveBoCount,
    required this.sport,
    required this.tags,
    required this.state,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class MatchClock {
  final int minute;
  final int second;
  final bool running;
  final int version;

  MatchClock({
    required this.minute,
    required this.second,
    required this.running,
    required this.version,
  });

  factory MatchClock.fromJson(Map<String, dynamic> json) =>
      _$MatchClockFromJson(json);
  Map<String, dynamic> toJson() => _$MatchClockToJson(this);
}

@JsonSerializable()
class Score {
  final String home;
  final String away;
  final String who;
  final int version;

  Score({
    required this.home,
    required this.away,
    required this.who,
    required this.version,
  });

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}

@JsonSerializable()
class LiveStat {
  final String occurrenceTypeId;
  final int count;

  LiveStat({required this.occurrenceTypeId, required this.count});

  factory LiveStat.fromJson(Map<String, dynamic> json) =>
      _$LiveStatFromJson(json);
  Map<String, dynamic> toJson() => _$LiveStatToJson(this);
}

@JsonSerializable(explicitToJson: true, checked: true)
class LiveData {
  final int eventId;
  final MatchClock? matchClock;
  final Score? score;
  final List<LiveStat>? liveStatistics;

  LiveData({
    required this.eventId,
    this.matchClock,
    this.score,
    this.liveStatistics,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) =>
      _$LiveDataFromJson(json);
  Map<String, dynamic> toJson() => _$LiveDataToJson(this);
}

@JsonSerializable()
class Criterion {
  final int id;
  final String label;
  final String englishLabel;
  final List<dynamic> order;
  final String? occurrenceType;
  final String? lifetime;

  Criterion({
    required this.id,
    required this.label,
    required this.englishLabel,
    required this.order,
    this.occurrenceType,
    this.lifetime,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) =>
      _$CriterionFromJson(json);
  Map<String, dynamic> toJson() => _$CriterionToJson(this);
}

@JsonSerializable()
class BetOfferType {
  final int id;
  final String name;
  final String englishName;

  BetOfferType({
    required this.id,
    required this.name,
    required this.englishName,
  });

  factory BetOfferType.fromJson(Map<String, dynamic> json) =>
      _$BetOfferTypeFromJson(json);
  Map<String, dynamic> toJson() => _$BetOfferTypeToJson(this);
}

@JsonSerializable()
class Outcome {
  final int id;
  final String label;
  final String englishLabel;
  final int? odds;
  final String? participant;
  final String type;
  final int betOfferId;
  final String changedDate;
  final int? participantId;
  final String? oddsFractional;
  final String? oddsAmerican;
  final String status;
  final String cashOutStatus;

  Outcome({
    required this.id,
    required this.label,
    required this.englishLabel,
    required this.odds,
    this.participant,
    required this.type,
    required this.betOfferId,
    required this.changedDate,
    this.participantId,
    required this.oddsFractional,
    required this.oddsAmerican,
    required this.status,
    required this.cashOutStatus,
  });

  factory Outcome.fromJson(Map<String, dynamic> json) =>
      _$OutcomeFromJson(json);
  Map<String, dynamic> toJson() => _$OutcomeToJson(this);
}

@JsonSerializable()
class OddsStats {
  final bool unexpectedOddsTrend;
  final int outcomeId;
  final int startingOdds;
  final String startingOddsFractional;
  final String startingOddsAmerican;

  OddsStats({
    required this.unexpectedOddsTrend,
    required this.outcomeId,
    required this.startingOdds,
    required this.startingOddsFractional,
    required this.startingOddsAmerican,
  });

  factory OddsStats.fromJson(Map<String, dynamic> json) =>
      _$OddsStatsFromJson(json);
  Map<String, dynamic> toJson() => _$OddsStatsToJson(this);
}

@JsonSerializable(explicitToJson: true, checked: true)
class MainBetOffer {
  final int id;
  final Criterion criterion;
  final BetOfferType betOfferType;
  final int eventId;
  final List<Outcome> outcomes;
  final List<String> tags;
  final OddsStats? oddsStats;
  final String cashOutStatus;

  MainBetOffer({
    required this.id,
    required this.criterion,
    required this.betOfferType,
    required this.eventId,
    required this.outcomes,
    required this.tags,
    this.oddsStats,
    required this.cashOutStatus,
  });

  factory MainBetOffer.fromJson(Map<String, dynamic> json) =>
      _$MainBetOfferFromJson(json);
  Map<String, dynamic> toJson() => _$MainBetOfferToJson(this);
}
