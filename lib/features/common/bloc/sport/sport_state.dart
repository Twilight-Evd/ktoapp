part of "bloc.dart";

abstract class SportState {}

class SportInitial extends SportState {}

class GroupLoading extends SportState {}

class GroupLoaded extends SportState {
  final List<GroupModel> allGroups;
  final List<GroupModel> liveGroups;
  final List<GroupModel> filteredGroups;
  GroupLoaded({
    required this.allGroups,
    required this.liveGroups,
    required this.filteredGroups,
  });
}

class MatchLoading extends SportState {}

class MatchLoaded extends SportState {
  final Map<int, List<MatchModel>> matches;
  final Map<int, List<EventPath>> eventPath;
  MatchLoaded({required this.matches, required this.eventPath});
}

class SportError extends SportState {
  final String message;
  SportError(this.message);
}

class ExternalIdLoaded extends SportState {
  final int? id;
  ExternalIdLoaded({this.id});
}
