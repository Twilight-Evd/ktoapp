import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/shimmer_widget.dart';
import '../../../shared/widgets/icon_label.dart';
import '../../../app/icons/icon.dart';
import '../../common/models/match_model.dart';
import '../../common/widgets/betslip/riverpod/betslip_notifier.dart';
import '../../common/widgets/betslip/riverpod/selection_model.dart';
import '../../common/widgets/timer.dart';
import 'outcome_view.dart';

class MatchView extends ConsumerWidget {
  final MatchModel? matchModel;

  const MatchView({super.key, this.matchModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionsInSlip = ref.watch(betSlipProvider).selections;
    final notifier = ref.read(betSlipProvider.notifier);

    final loading = matchModel == null;
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.pushNamed("detail", extra: matchModel);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.box(
                    loading: loading,
                    height: 20,
                    child: matchModel != null
                        ? Row(
                            children: [
                              (matchModel!.liveData?.matchClock?.running ??
                                      false)
                                  ? TimerDisplay(
                                      minutes:
                                          matchModel!
                                              .liveData
                                              ?.matchClock
                                              ?.minute ??
                                          0,
                                      seconds:
                                          matchModel!
                                              .liveData
                                              ?.matchClock
                                              ?.second ??
                                          0,
                                    )
                                  : Text(
                                      "sáb. @ 22:30",
                                      // style: TextStyle(color: Colors.white54),
                                    ),
                              Spacer(),
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
                          )
                        : SizedBox.shrink(),
                  ),
                  SizedBox(height: 6),
                  ShimmerWidget.box(
                    loading: loading,
                    height: 20,
                    child: matchModel != null
                        ? Text(
                            matchModel!.event.homeName,
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  SizedBox(height: 6),
                  ShimmerWidget.box(
                    loading: loading,
                    height: 20,
                    child: matchModel != null
                        ? Text(
                            matchModel!.event.awayName ?? "",
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  if (!loading)
                    IconWithLabel(
                      padding: EdgeInsets.all(0),
                      iconWidget: MyIcon.icon(
                        "ic_forword_arrow.svg",
                        width: 12,
                        // color: Colors.white54,
                      ),
                      text: "Mostrar mais apostas",
                      textStyle: TextStyle(
                        fontSize: 12,
                      ), //color: Colors.white54),
                      reversed: true,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (matchModel != null)
                  ...(matchModel!.mainBetOffer != null &&
                          matchModel!.mainBetOffer?.outcomes.isNotEmpty == true
                      ? matchModel!.mainBetOffer!.outcomes.map((outcome) {
                          final isSelected = selectionsInSlip.any(
                            (sel) => sel.id == "${outcome.id}",
                          );
                          return Expanded(
                            child: OutcomeView(
                              selected: isSelected,
                              onTap: () {
                                if (outcome.odds != null) {
                                  notifier.toggleSelection(
                                    Selection(
                                      id: "${outcome.id}",
                                      matchId: "${matchModel!.event.id}",
                                      name: outcome.label,
                                      odds: outcome.odds! / 100,
                                      market: outcome.label,
                                      event: matchModel!.event,
                                      betOfferType: matchModel!
                                          .mainBetOffer!
                                          .betOfferType,
                                      criterion:
                                          matchModel!.mainBetOffer!.criterion,
                                    ),
                                  );
                                }
                              },
                              value:
                                  (outcome.odds != null
                                          ? outcome.odds! / 1000
                                          : "")
                                      .toString(),
                            ),
                          );
                        }).toList()
                      : [
                          Expanded(child: OutcomeView(value: '')),
                          Expanded(child: OutcomeView(value: '')),
                          Expanded(child: OutcomeView(value: '')),
                        ])
                else ...[
                  Expanded(
                    child: ShimmerWidget.placeholder(
                      OutcomeView(value: ''),
                      loading: loading,
                      child: SizedBox.shrink(),
                    ),
                  ),
                  Expanded(
                    child: ShimmerWidget.placeholder(
                      OutcomeView(value: ''),
                      loading: loading,
                      child: SizedBox.shrink(),
                    ),
                  ),
                  Expanded(
                    child: ShimmerWidget.placeholder(
                      OutcomeView(value: ''),
                      loading: loading,
                      child: SizedBox.shrink(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
