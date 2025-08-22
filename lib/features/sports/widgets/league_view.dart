import 'package:flutter/material.dart';
import 'package:ktoapp/app/themes/theme.dart';

import '../../../shared/constants/country.dart';
import '../../../shared/widgets/divider.dart';
import '../../../shared/widgets/icon_label.dart';
import '../../../shared/widgets/shimmer_widget.dart';
import '../../../app/icons/icon.dart';
import '../../common/models/match_model.dart';
import 'match_view.dart';

class LeagueView extends StatelessWidget {
  final List<EventPath>? eventPath;
  final List<MatchModel>? matches;

  const LeagueView({super.key, required this.eventPath, required this.matches});

  @override
  Widget build(BuildContext context) {
    final loading = eventPath == null || matches == null;
    String? leaguePath;
    Country? country;
    if (!loading) {
      leaguePath = eventPath!.map((e) => e.name).join(' / ');
      country = getCountryByName(eventPath![1].termKey);
    }

    final theme = context.theme.colorScheme;
    return Container(
      // decoration: BoxDecoration(color: Color(0xff1e1e1e)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // color: Color(0xff262626),
            color: theme.surface,
            child: ShimmerWidget.box(
              loading: loading,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: IconWithLabel(
                      iconWidget: country != null
                          ? country.icon
                          : eventPath != null
                          ? MyIcon.iconSport(
                              "${eventPath![0].termKey}.svg",
                              width: 14,
                              color: theme.onSurface,
                            )
                          : SizedBox.shrink(),
                      padding: EdgeInsets.all(0),
                      text: leaguePath ?? "-",
                      textStyle: TextStyle(
                        // color: Colors.white,
                        color: theme.onSurface,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("1", style: TextStyle(color: theme.onSurface)),
                        Text("X", style: TextStyle(color: theme.onSurface)),
                        Text("2", style: TextStyle(color: theme.onSurface)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AutoDivider.horizontal(height: 1),
          SizedBox(height: 6),
          if (!loading) ...[
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  color: Colors.green,
                  child: IconWithLabel(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    iconWidget: MyIcon.iconSystem(
                      "early_payout.svg",
                      color: Colors.black,
                      width: 12,
                    ),
                    text: "GANHO ANTECIPADO",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "— Disponível para esta liga",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            AutoDivider.horizontal(height: 1),
          ],
          if (matches != null)
            ...matches!.expand(
              (e) => [
                MatchView(matchModel: e),
                AutoDivider.horizontal(height: 1),
              ],
            )
          else ...[
            MatchView(),
            AutoDivider.horizontal(height: 1),
          ],
        ],
      ),
    );
  }
}
