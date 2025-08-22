// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MatchModel',
  json,
  ($checkedConvert) {
    final val = MatchModel(
      event: $checkedConvert(
        'event',
        (v) => Event.fromJson(v as Map<String, dynamic>),
      ),
      liveData: $checkedConvert(
        'liveData',
        (v) => v == null ? null : LiveData.fromJson(v as Map<String, dynamic>),
      ),
      mainBetOffer: $checkedConvert(
        'mainBetOffer',
        (v) =>
            v == null ? null : MainBetOffer.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'event': instance.event.toJson(),
      'liveData': instance.liveData?.toJson(),
      'mainBetOffer': instance.mainBetOffer?.toJson(),
    };

EventPath _$EventPathFromJson(Map<String, dynamic> json) => EventPath(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  englishName: json['englishName'] as String,
  termKey: json['termKey'] as String,
);

Map<String, dynamic> _$EventPathToJson(EventPath instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'englishName': instance.englishName,
  'termKey': instance.termKey,
};

Event _$EventFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Event',
  json,
  ($checkedConvert) {
    final val = Event(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      englishName: $checkedConvert('englishName', (v) => v as String),
      homeName: $checkedConvert('homeName', (v) => v as String),
      awayName: $checkedConvert('awayName', (v) => v as String?),
      start: $checkedConvert('start', (v) => v as String),
      group: $checkedConvert('group', (v) => v as String),
      groupId: $checkedConvert('groupId', (v) => (v as num).toInt()),
      path: $checkedConvert(
        'path',
        (v) => (v as List<dynamic>)
            .map((e) => EventPath.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      nonLiveBoCount: $checkedConvert(
        'nonLiveBoCount',
        (v) => (v as num?)?.toInt(),
      ),
      liveBoCount: $checkedConvert('liveBoCount', (v) => (v as num?)?.toInt()),
      sport: $checkedConvert('sport', (v) => v as String),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      state: $checkedConvert('state', (v) => v as String),
    );
    return val;
  },
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'englishName': instance.englishName,
  'homeName': instance.homeName,
  'awayName': instance.awayName,
  'start': instance.start,
  'group': instance.group,
  'groupId': instance.groupId,
  'path': instance.path.map((e) => e.toJson()).toList(),
  'nonLiveBoCount': instance.nonLiveBoCount,
  'liveBoCount': instance.liveBoCount,
  'sport': instance.sport,
  'tags': instance.tags,
  'state': instance.state,
};

MatchClock _$MatchClockFromJson(Map<String, dynamic> json) => MatchClock(
  minute: (json['minute'] as num).toInt(),
  second: (json['second'] as num).toInt(),
  running: json['running'] as bool,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$MatchClockToJson(MatchClock instance) =>
    <String, dynamic>{
      'minute': instance.minute,
      'second': instance.second,
      'running': instance.running,
      'version': instance.version,
    };

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
  home: json['home'] as String,
  away: json['away'] as String,
  who: json['who'] as String,
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
  'home': instance.home,
  'away': instance.away,
  'who': instance.who,
  'version': instance.version,
};

LiveStat _$LiveStatFromJson(Map<String, dynamic> json) => LiveStat(
  occurrenceTypeId: json['occurrenceTypeId'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$LiveStatToJson(LiveStat instance) => <String, dynamic>{
  'occurrenceTypeId': instance.occurrenceTypeId,
  'count': instance.count,
};

LiveData _$LiveDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LiveData', json, ($checkedConvert) {
      final val = LiveData(
        eventId: $checkedConvert('eventId', (v) => (v as num).toInt()),
        matchClock: $checkedConvert(
          'matchClock',
          (v) =>
              v == null ? null : MatchClock.fromJson(v as Map<String, dynamic>),
        ),
        score: $checkedConvert(
          'score',
          (v) => v == null ? null : Score.fromJson(v as Map<String, dynamic>),
        ),
        liveStatistics: $checkedConvert(
          'liveStatistics',
          (v) => (v as List<dynamic>?)
              ?.map((e) => LiveStat.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LiveDataToJson(LiveData instance) => <String, dynamic>{
  'eventId': instance.eventId,
  'matchClock': instance.matchClock?.toJson(),
  'score': instance.score?.toJson(),
  'liveStatistics': instance.liveStatistics?.map((e) => e.toJson()).toList(),
};

Criterion _$CriterionFromJson(Map<String, dynamic> json) => Criterion(
  id: (json['id'] as num).toInt(),
  label: json['label'] as String,
  englishLabel: json['englishLabel'] as String,
  order: json['order'] as List<dynamic>,
  occurrenceType: json['occurrenceType'] as String?,
  lifetime: json['lifetime'] as String?,
);

Map<String, dynamic> _$CriterionToJson(Criterion instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'englishLabel': instance.englishLabel,
  'order': instance.order,
  'occurrenceType': instance.occurrenceType,
  'lifetime': instance.lifetime,
};

BetOfferType _$BetOfferTypeFromJson(Map<String, dynamic> json) => BetOfferType(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  englishName: json['englishName'] as String,
);

Map<String, dynamic> _$BetOfferTypeToJson(BetOfferType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'englishName': instance.englishName,
    };

Outcome _$OutcomeFromJson(Map<String, dynamic> json) => Outcome(
  id: (json['id'] as num).toInt(),
  label: json['label'] as String,
  englishLabel: json['englishLabel'] as String,
  odds: (json['odds'] as num?)?.toInt(),
  participant: json['participant'] as String?,
  type: json['type'] as String,
  betOfferId: (json['betOfferId'] as num).toInt(),
  changedDate: json['changedDate'] as String,
  participantId: (json['participantId'] as num?)?.toInt(),
  oddsFractional: json['oddsFractional'] as String?,
  oddsAmerican: json['oddsAmerican'] as String?,
  status: json['status'] as String,
  cashOutStatus: json['cashOutStatus'] as String,
);

Map<String, dynamic> _$OutcomeToJson(Outcome instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'englishLabel': instance.englishLabel,
  'odds': instance.odds,
  'participant': instance.participant,
  'type': instance.type,
  'betOfferId': instance.betOfferId,
  'changedDate': instance.changedDate,
  'participantId': instance.participantId,
  'oddsFractional': instance.oddsFractional,
  'oddsAmerican': instance.oddsAmerican,
  'status': instance.status,
  'cashOutStatus': instance.cashOutStatus,
};

OddsStats _$OddsStatsFromJson(Map<String, dynamic> json) => OddsStats(
  unexpectedOddsTrend: json['unexpectedOddsTrend'] as bool,
  outcomeId: (json['outcomeId'] as num).toInt(),
  startingOdds: (json['startingOdds'] as num).toInt(),
  startingOddsFractional: json['startingOddsFractional'] as String,
  startingOddsAmerican: json['startingOddsAmerican'] as String,
);

Map<String, dynamic> _$OddsStatsToJson(OddsStats instance) => <String, dynamic>{
  'unexpectedOddsTrend': instance.unexpectedOddsTrend,
  'outcomeId': instance.outcomeId,
  'startingOdds': instance.startingOdds,
  'startingOddsFractional': instance.startingOddsFractional,
  'startingOddsAmerican': instance.startingOddsAmerican,
};

MainBetOffer _$MainBetOfferFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MainBetOffer', json, ($checkedConvert) {
      final val = MainBetOffer(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        criterion: $checkedConvert(
          'criterion',
          (v) => Criterion.fromJson(v as Map<String, dynamic>),
        ),
        betOfferType: $checkedConvert(
          'betOfferType',
          (v) => BetOfferType.fromJson(v as Map<String, dynamic>),
        ),
        eventId: $checkedConvert('eventId', (v) => (v as num).toInt()),
        outcomes: $checkedConvert(
          'outcomes',
          (v) => (v as List<dynamic>)
              .map((e) => Outcome.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        oddsStats: $checkedConvert(
          'oddsStats',
          (v) =>
              v == null ? null : OddsStats.fromJson(v as Map<String, dynamic>),
        ),
        cashOutStatus: $checkedConvert('cashOutStatus', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MainBetOfferToJson(MainBetOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'criterion': instance.criterion.toJson(),
      'betOfferType': instance.betOfferType.toJson(),
      'eventId': instance.eventId,
      'outcomes': instance.outcomes.map((e) => e.toJson()).toList(),
      'tags': instance.tags,
      'oddsStats': instance.oddsStats?.toJson(),
      'cashOutStatus': instance.cashOutStatus,
    };
