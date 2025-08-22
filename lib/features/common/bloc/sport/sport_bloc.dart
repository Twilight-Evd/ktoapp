part of "bloc.dart";

class SportBloc extends Bloc<SportEvent, SportState> {
  final SportRepository repository;

  List<GroupModel> _allGroups = [];
  List<GroupModel> _liveGroups = [];
  List<GroupModel> _filteredGroups = [];
  // List<MatchModel> _matches = [];

  SportBloc(this.repository) : super(SportInitial()) {
    on<LoadGroups>(_loadGroup);
    on<ApplyGroupFilter>(_applyGroupFilter);
    on<LoadMatches>(_loadMatches);
    on<GetExternalEvent>(_getExternalEvent);
  }

  Future<void> _loadGroup(event, emit) async {
    emit(GroupLoading());
    try {
      _allGroups = await repository.fetchGroups();
      // _liveGroups = await repository.fetchLiveGroups();
      // _filteredGroups = _allGroups;

      logger.d(">>>>>>>>>. loadgroup ${_allGroups.length}");
      emit(
        GroupLoaded(
          allGroups: _allGroups,
          liveGroups: _liveGroups,
          filteredGroups: _filteredGroups,
        ),
      );
    } catch (e) {
      emit(SportError(e.toString()));
    }
  }

  Future<void> _loadMatches(event, emit) async {
    emit(MatchLoading());
    try {
      // await Future.delayed(Duration(seconds: 10));
      final matches = await repository.fetchMatches();

      final Map<int, List<MatchModel>> groupedMatches = {};
      final Map<int, List<EventPath>> eventPath = {};
      for (var m in matches) {
        if (!groupedMatches.containsKey(m.event.groupId)) {
          groupedMatches[m.event.groupId] = [];
          eventPath[m.event.groupId] = m.event.path;
        }
        groupedMatches[m.event.groupId]!.add(m);
      }
      emit(MatchLoaded(matches: groupedMatches, eventPath: eventPath));
    } catch (e) {
      emit(SportError(e.toString()));
    }
  }

  Future<void> _applyGroupFilter(event, emit) async {
    try {
      _filteredGroups = await repository.fetchFilteredGroups(event.keyword);
      // emit(
      //   GroupLoaded(
      //     allGroups: _allGroups,
      //     liveGroups: _liveGroups,
      //     filteredGroups: _filteredGroups,
      //   ),
      // );
    } catch (e) {
      emit(SportError(e.toString()));
    }
  }

  Future<void> _getExternalEvent(event, emit) async {
    try {
      final id = await repository.getBetradarEventID(event.eventId);
      emit(ExternalIdLoaded(id: id));
    } on ApiException catch (e) {
      logger.d(e.toString());
      emit(SportError(e.toString()));
    }
  }
}
