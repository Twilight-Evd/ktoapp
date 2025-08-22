import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../app/config/app_config.dart';
import '../../../app/icons/icon.dart';
import '../../../core/utils/log.dart';
import '../../../core/utils/util.dart';
import '../../../shared/widgets/betradar/model.dart';
import '../../../shared/widgets/divider.dart';
import '../../../shared/widgets/triangle.dart';
import '../../common/bloc/sport/bloc.dart';
import '../../common/models/match_model.dart';
import '../../common/models/tag_filter_model.dart';
import '../../common/widgets/betslip/riverpod/betslip_notifier.dart';
import '../widgets/score_board.dart';
import '../widgets/tag_filter.dart';

class DetailPage extends ConsumerWidget {
  final MatchModel matchModel;
  const DetailPage({super.key, required this.matchModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betrader = Betradar.getInstance(
      betraderClientID: betraderClientID,
      setting: BetradarSetting(
        detailedScoreboard: "disable",
        goalBannerCustomBgColor: "#000000",
        goalBannerImage: [
          'https://kto.kgp-cdn.com/kto/2025/01/21125816/Logo_LED.svg',
        ],
        layout: "single",
        logo: ['https://kto.kgp-cdn.com/kto/2025/01/21125911/Logo_Panels.svg'],
        pitchCustomBgColor: "#74AD30",
        pitchLogo: "https://kto.kgp-cdn.com/kto/2025/01/21131654/Logo.svg",
        tabsPosition: "top",
      ),
      css: ["https://static.kto.bet.br/css/kambi.css"],
      referDomain: baseDomain,
    );

    final appBarTheme = context.theme.appBarTheme;
    final colorScheme = context.theme.colorScheme;

    final notifier = ref.read(betSlipProvider.notifier);

    Future.microtask(() {
      notifier.updateMini(isMini: true, miniMode: true);
    });

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        notifier.updateMini(isMini: false, miniMode: false, isExpanded: false);
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (_) =>
                SportBloc(context.read<SportRepository>())
                  ..add(GetExternalEvent(matchModel.event.id)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: MyIcon.iconSystem(
                          "chevron__left.svg",
                          color: appBarTheme.iconTheme?.color,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              matchModel.event.homeName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text("vs"),
                            ),
                            Text(
                              matchModel.event.awayName!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: false,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: MyIcon.icon("ic_promotions.svg"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          // color: Color(0xff1e1e1e),
                          child: Text(
                            UtilHelper.formatStartTime(matchModel.event.start),
                          ),
                        ),
                        AutoDivider.horizontal(height: 1),
                        ScoreBoard(
                          stage: "Segunda parte",
                          time: "53:48",
                          textColor: colorScheme.onSurface,
                          backgroundColor: colorScheme
                              .surfaceContainer, // Color(0xff1e1e1e),
                          highlightBackground: colorScheme.secondary, // 高亮背景色
                          highlightTextColor: colorScheme.onSecondary,
                          topWidgets: [
                            Container(
                              width: 12,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.yellow,
                              ),
                            ),
                            MyIcon.iconSystem(
                              "corner.svg",
                              color: Colors.red,
                              width: 12,
                            ),
                            MyIcon.iconSport(
                              "football.svg",
                              width: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ],
                          homeTeam: matchModel.event.homeName,
                          awayTeam: matchModel.event.awayName!,
                          homeStats: [9, 9, 9, 3],
                          awayStats: [0, 0, 2, 1],
                        ),
                        AutoDivider.horizontal(height: 1),
                        BlocBuilder<SportBloc, SportState>(
                          builder: (BuildContext context, SportState state) {
                            if (state is ExternalIdLoaded) {
                              return betrader.render(
                                state.id!,
                                brightness: context.brightness,
                              );
                            }
                            return SizedBox.shrink();
                          },
                          buildWhen: (previous, current) =>
                              current is ExternalIdLoaded && current.id != null,
                        ),
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
                        SizedBox(height: 8),
                        ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            /// 1. Resultado Final
                            _BettingCard(
                              title: 'Resultado Final',
                              children: [
                                _OddsRow(
                                  items: [
                                    _OddsButton(
                                      label: 'São Paulo',
                                      odds: '1.63',
                                    ),
                                    _OddsButton(label: 'Empate', odds: '3.50'),
                                    _OddsButton(label: 'Vitória', odds: '6.10'),
                                  ],
                                ),
                              ],
                            ),
                            AutoDivider.horizontal(height: 1),

                            /// 2. Total de gols
                            _BettingCard(
                              title: 'Total de gols',
                              children: [
                                Slider(
                                  value: 2.5,
                                  min: 0,
                                  max: 5,
                                  divisions: 10,
                                  onChanged: (_) {},
                                ),
                                _OddsRow(
                                  items: [
                                    _OddsButton(
                                      label: 'Mais 2.5',
                                      odds: '2.65',
                                    ),
                                    _OddsButton(
                                      label: 'Menos 2.5',
                                      odds: '1.46',
                                    ),
                                  ],
                                ),
                                _ShowListButton(),
                              ],
                            ),
                            AutoDivider.horizontal(height: 1),

                            /// 3. Chance dupla
                            _BettingCard(
                              title: 'Chance dupla',
                              children: [
                                _OddsRow(
                                  items: [
                                    _OddsButton(
                                      label: '1X',
                                      odds: '1.12',
                                      expand: true,
                                    ),
                                  ],
                                ),
                                _OddsRow(
                                  items: [
                                    _OddsButton(
                                      label: '12',
                                      odds: '1.27',
                                      expand: true,
                                    ),
                                  ],
                                ),
                                _OddsRow(
                                  items: [
                                    _OddsButton(
                                      label: 'X2',
                                      odds: '2.15',
                                      expand: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AutoDivider.horizontal(height: 1),

                            /// 4. Ambos os times marcam
                            _BettingCard(
                              title: 'Ambos os times marcam',
                              children: [
                                _OddsRow(
                                  items: [
                                    _OddsButton(label: 'Sim', odds: '2.55'),
                                    _OddsButton(label: 'Não', odds: '1.44'),
                                  ],
                                ),
                              ],
                            ),
                            AutoDivider.horizontal(height: 1),

                            /// 5. Resultado correto
                            _BettingCard(
                              title: 'Resultado correto',
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'São Paulo',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 4,
                                            children: List.generate(
                                              5,
                                              (i) => _ScoreBox(label: '$i'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Vitória',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 4,
                                            children: List.generate(
                                              4,
                                              (i) => _ScoreBox(label: '$i'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                _ShowListButton(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// -------------------- 子组件 --------------------

class _BettingCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _BettingCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      // margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.theme.cardColor, // const Color(0xff1e1e1e),
        // borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onSurface, //Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Container(
                color: Colors.green,
                child: MyIcon.iconSystem(
                  "early_payout.svg",
                  color: Colors.black,
                  width: 14,
                ),
              ),
              SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff5dcbd3),
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  "CA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class _OddsRow extends StatelessWidget {
  final List<Widget> items;
  const _OddsRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _OddsButton extends StatelessWidget {
  final String label;
  final String odds;
  final bool expand;
  const _OddsButton({
    required this.label,
    required this.odds,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: appColors.selectionColor, // const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: appColors.onSelectionColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 2),
              Text(
                "0.5",
                style: TextStyle(
                  color: appColors.onSelectionColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TriangleIndicator(isUp: true),
              SizedBox(width: 2),
              Text(
                odds,
                style: TextStyle(
                  color: appColors.onSelectionOddsColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreBox extends StatelessWidget {
  final String label;
  const _ScoreBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _ShowListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text('Mostrar lista ▼', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}
