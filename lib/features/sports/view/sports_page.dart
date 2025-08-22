import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../app/icons/icon.dart';
import '../../../core/utils/log.dart';
import '../../../shared/mixins/menu_aware.dart';
import '../../../shared/widgets/divider.dart';
import '../../../shared/widgets/icon_label.dart';
import '../../../shared/widgets/progressive_shimmer.dart';
import '../../../shared/widgets/shimmer_widget.dart';

import '../../common/bloc/sport/bloc.dart';
import '../../common/models/group/group_model.dart';
import '../../common/models/tag_filter_model.dart';
import '../widgets/league_view.dart';
import '../widgets/tag_filter.dart';

class EsportsPage extends StatelessWidget with MenuAwareMixin {
  const EsportsPage({super.key});

  Widget _buildBanner() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            child: Image.asset(
              'assets/images/temp/carousel_3.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 180,
            child: Image.asset(
              'assets/images/temp/carousel_3.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderLeague() {
    return BlocBuilder<SportBloc, SportState>(
      buildWhen: (previous, current) =>
          current is MatchLoading || current is MatchLoaded,
      builder: (context, state) {
        final items = state is MatchLoaded ? state.eventPath.keys.toList() : [];
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
          placeholderBuilder: LeagueView(eventPath: null, matches: null),
        );
      },
    );
  }

  @override
  void onHidden() {
    logger.d(">>>>>>>>>>>> 0 onHidden ");
  }

  @override
  void onVisible() {
    logger.d(">>>>>>>>>>>> 0 onVisible ");
  }

  @override
  Widget build(BuildContext context) {
    return buildWithVisibilityListener(
      context,
      child: BlocProvider(
        create: (_) => SportBloc(context.read<SportRepository>())
          ..add(LoadGroups())
          ..add(LoadMatches()),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(10), child: TopIcons()),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: _buildBanner(),
              ),
              TagFilter(
                tags: [
                  TagFilterModel(id: 0, name: 'Principais Ligas'),
                  TagFilterModel(id: 1, name: 'Jogos de Hoje'),
                  TagFilterModel(id: 2, name: 'Futebol'),
                  TagFilterModel(id: 3, name: 'Basquete'),
                  TagFilterModel(id: 4, name: 'Tênis'),
                ],
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
              _renderLeague(),
            ],
          ),
        ),
      ),
    ); //.
  }
}

class TopIcons extends StatelessWidget {
  const TopIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.colorScheme;
    return BlocBuilder<SportBloc, SportState>(
      buildWhen: (previous, current) =>
          current is GroupLoaded || current is GroupLoading,
      builder: (context, state) {
        final groups = state is GroupLoading
            ? <GroupModel>[]
            : state is GroupLoaded
            ? state.allGroups.where((model) => model.sortOrder != null).toList()
            : <GroupModel>[];
        return ProgressiveShimmerList<GroupModel>.flex(
          key: Key("sports_icon"),
          padding: EdgeInsetsGeometry.all(0),
          scrollDirection: Axis.horizontal,
          prefixWidgets: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                // color: Color(0xff323232),
                color: theme.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: MyIcon.icon(
                  "search.svg",
                  color: theme.onSecondaryContainer,
                ),
              ),
            ),
          ],
          suffixWidgets: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  // color: Color(0xff323232),
                  color: theme.secondaryContainer,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: IconWithLabel(
                  iconWidget: MyIcon.icon("ic_forword_arrow.svg", width: 16),
                  padding: EdgeInsets.all(0),
                  text: "Todos os Esportes",
                  textStyle: TextStyle(
                    color: theme.onSecondaryContainer,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  reversed: true,
                ),
              ),
            ),
          ],
          loading: state is GroupLoading,
          items: groups,
          itemBuilder: (item) => Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              // color: Color(0xff323232),
              color: theme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: MyIcon.iconSport(
                "${item.termKey?.replaceFirst("_", "")}.svg",
                color: theme.onSecondaryContainer,
              ),
            ),
          ),
          placeholderBuilder: Container(
            margin: EdgeInsets.only(right: 8),
            child: ShimmerWidget.avatar(
              size: 38,
              loading: state is GroupLoading,
            ),
          ),
        );
      },
    );
  }
}
