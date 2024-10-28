import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../home_widgets.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: dp),
            child: Column(
              children: <Widget>[
                StatsItemsWidget(
                  onePer: "10%",
                  twoPer: "90%",
                  title: "Ball Possession (%)",
                  oneValue: .10,
                  twoValue: .90,
                ),
                StatsItemsWidget(
                  onePer: "1",
                  twoPer: "1",
                  title: "Shot(s) on Target",
                  oneValue: .50,
                  twoValue: .50,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "1",
                  title: "Shot(s) off Target",
                  oneValue: 1.0,
                  twoValue: .20,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "3",
                  title: "Corner Kick(s)",
                  oneValue: .30,
                  twoValue: .30,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "5",
                  title: "Foul(s)",
                  oneValue: .30,
                  twoValue: .50,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "6",
                  title: "Yellow Card(s)",
                  oneValue: .30,
                  twoValue: .60,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "3",
                  title: "Red Card(s)",
                  oneValue: .3,
                  twoValue: .3,
                ),
                StatsItemsWidget(
                  onePer: "3",
                  twoPer: "3",
                  title: "Throw-in(s)",
                  oneValue: .3,
                  twoValue: .3,
                ),
                StatsItemsWidget(
                  onePer: "16",
                  twoPer: "7",
                  title: "Crosses",
                  oneValue: .80,
                  twoValue: .40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
