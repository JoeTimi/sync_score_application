import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../home/home_one_widgets.dart';
import '../prediction_widgets.dart';

class PredictionTab extends StatefulWidget {
  const PredictionTab({super.key});

  @override
  State<PredictionTab> createState() => _PredictionTabState();
}

class _PredictionTabState extends State<PredictionTab> {
  int selectedStage = 0;
  double oneValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 5,
                      isRTL: true,
                      barRadius: const Radius.circular(6),
                      percent: oneValue,
                      backgroundColor: const Color(0xFFD9D9D9),
                      progressColor: mainAppColor,
                    ),
                  ),
                ),
                Text(
                  "0/10",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackColor.withOpacity(.48),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: OptionWidget(
                    height: 30,
                    width: double.infinity,
                    title: "Today July 10, 2024",
                    isSelected: selectedStage == 0 ? true : false,
                    onTap: () {
                      setState(() {
                        selectedStage = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: OptionWidget(
                    height: 30,
                    width: double.infinity,
                    title: "Tomorrow",
                    isRightP: false,
                    isSelected: selectedStage == 1 ? true : false,
                    onTap: () {
                      setState(() {
                        selectedStage = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const PredictionItemsWidget(
              time: "16:00",
              tOneLogo: "assets/main_images/team2.png",
              tOneName: "Liverpool",
              tTwoLogo: "assets/start_images/team1.png",
              tTwoName: "Chelsea",
            ),
          ],
        ),
      ),
    );
  }
}
