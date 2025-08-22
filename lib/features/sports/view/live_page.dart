import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/log.dart';
import '../../../shared/mixins/menu_aware.dart';
import '../../../shared/widgets/divider.dart';
import '../../../shared/widgets/progressive_shimmer.dart';
import '../../common/bloc/sport/bloc.dart';
import '../../common/models/tag_filter_model.dart';
import '../widgets/league_view.dart';
import '../widgets/tag_filter.dart';

class LivePage extends StatelessWidget with MenuAwareMixin {
  const LivePage({super.key});

  @override
  void onHidden() {
    logger.d(">>>>>>>>>>>> 1 onHidden ");
  }

  @override
  void onVisible() {
    logger.d(">>>>>>>>>>>> 1 onVisible ");
  }

  @override
  Widget build(BuildContext context) {
    return buildWithVisibilityListener(
      context,
      child: BlocProvider(
        create: (_) =>
            SportBloc(context.read<SportRepository>())..add(LoadMatches()),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TagFilter(
                tags: [
                  TagFilterModel(id: 0, name: 'Principais Ligas'),
                  TagFilterModel(id: 1, name: 'Jogos de Hoje'),
                  TagFilterModel(id: 2, name: 'Futebol'),
                  TagFilterModel(id: 3, name: 'Basquete'),
                  TagFilterModel(id: 4, name: 'Tênis'),
                ],
                onSelected: (value) {
                  logger.d(">>>>>>>>>>>> select. $value");
                },
              ),
              AutoDivider.horizontal(height: 1),
              TagFilter(
                tags: [
                  TagFilterModel(id: 0, name: 'Todos'),
                  TagFilterModel(id: 1, name: 'Brasileirão Série A'),
                  TagFilterModel(id: 2, name: 'Brasileirão Série B'),
                  TagFilterModel(id: 3, name: 'Copa América'),
                ],
              ),
              AutoDivider.horizontal(height: 1),
              Container(
                width: double.infinity,
                // color: const Color(0xff1e1e1e),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text("Ligas Populares"),
              ),
              BlocBuilder<SportBloc, SportState>(
                buildWhen: (previous, current) =>
                    current is MatchLoading || current is MatchLoaded,
                builder: (context, state) {
                  final items = state is MatchLoaded
                      ? state.eventPath.keys.toList()
                      : [];
                  return ProgressiveShimmerList.listView(
                    scroll: false,
                    padding: EdgeInsetsGeometry.all(0),
                    loading: state is MatchLoading,
                    placeholderCount: 2,
                    items: items,
                    itemBuilder: (i) => state is MatchLoaded
                        ? LeagueView(
                            eventPath: state.eventPath[i],
                            matches: state.matches[i]!,
                          )
                        : const SizedBox(),
                    placeholderBuilder: LeagueView(
                      eventPath: null,
                      matches: null,
                    ),
                  );
                },
              ),
              // _renderLeague(),
            ],
          ),
        ),
      ),
    );
  }
}
