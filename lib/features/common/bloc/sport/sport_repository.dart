part of "bloc.dart";

class SportRepository extends BaseRepository {
  final NetworkManager networkManager;

  SportRepository(this.networkManager);

  Future<List<GroupModel>> fetchGroups() async {
    final res = await networkManager.get(
      'https://us1.offering-api.kambicdn.com/offering/v2018/ktobr/group.json?channel_id=3&client_id=2&lang=pt_BR&market=BR',
    );

    return handleResponse(res, (data) {
      if (data is Map<String, dynamic> &&
          data['group'] is Map<String, dynamic> &&
          data['group']['groups'] is List) {
        final List<dynamic> groupList = data['group']['groups'];
        return groupList.map((e) => GroupModel.fromJson(e)).toList();
      }
      return [];
    });
  }

  Future<List<MatchModel>> fetchMatches() async {
    final res = await networkManager.get(
      'https://us1.offering-api.kambicdn.com/offering/v2018/ktobr/event/live/open.json?lang=pt_BR&market=BR&client_id=2&channel_id=3&ncid=${DateTime.now().millisecondsSinceEpoch}',
    );

    return handleResponse(res, (data) {
      if (data is Map<String, dynamic> && data['liveEvents'] is List) {
        final List<dynamic> matchList = data['liveEvents'];
        return matchList.map((e) => MatchModel.fromJson(e)).toList();
      }
      return [];
    });
    // try {
    //   final dynamic data = res.data;
    //   if (data is Map<String, dynamic> && data['liveEvents'] is List) {
    //     final List<dynamic> matchList = data['liveEvents'];
    //     return matchList.map((e) {
    //       try {
    //         return MatchModel.fromJson(e);
    //       } catch (ex, stack) {
    //         print("⚠️ JSON 解析异常: $ex");
    //         print("🚨 原始数据: $e");
    //         print("🔍 Stack Trace: $stack");
    //         rethrow;
    //       }
    //     }).toList();
    //   }
    // } catch (e) {
    //   logger.e(e);
    // }
    // return [];
  }

  Future<List<GroupModel>> fetchLiveGroups() async {
    final res = await networkManager.get('https://your.api/groups/live.json');
    final List<dynamic> jsonList = res.data;
    return jsonList.map((e) => GroupModel.fromJson(e)).toList();
  }

  Future<List<GroupModel>> fetchFilteredGroups(String keyword) async {
    final res = await networkManager.get(
      'https://your.api/groups/search.json',
      queryParameters: {"q": keyword},
    );
    final List<dynamic> jsonList = res.data;
    return jsonList.map((e) => GroupModel.fromJson(e)).toList();
  }

  Future<int?> getBetradarEventID(int id) async {
    final res = await networkManager.get(
      'https://us1.offering-api.kambicdn.com/offering/v2018/ktobr/statistics/event/$id.json?externalEventProvider=EP_BETRADAR',
    );

    return handleResponse(res, (data) {
      final eventMappingResponse = EventMappingResponse.fromJson(data);
      if (eventMappingResponse.eventMapping.isNotEmpty) {
        final em = eventMappingResponse.eventMapping
            .where((e) => e.externalProvider == "BETRADAR")
            .firstOrNull;

        if (em != null) {
          return em.externalId;
        }
      }
      return null;
    });
  }

  //ktobr
  //fetch(`https://settings-api.kambicdn.com/${offering}__visualisation.json`)

  //https://us1.offering-api.kambicdn.com/offering/v2018/ktobr/statistics/event/1024483445.json?externalEventProvider=EP_BETRADAR
}
