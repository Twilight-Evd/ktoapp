part of "bloc.dart";

abstract class SportEvent {}

class LoadGroups extends SportEvent {}

class LoadLiveGroups extends SportEvent {}

class ApplyGroupFilter extends SportEvent {
  final String keyword;
  ApplyGroupFilter(this.keyword);
}

class LoadMatches extends SportEvent {}

class GetExternalEvent extends SportEvent {
  final int eventId;

  GetExternalEvent(this.eventId);
}
