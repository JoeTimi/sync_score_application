import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/models/matches_model.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_screen.dart';

import '../../../home_widgets.dart';

class OverviewTab extends StatefulWidget {
  // const OverviewTab({super.key});
  final String homeTeamName;
  final String awayTeamName;
  final String finalScore;
  final List<StatusItem> statusItems; // A list to hold events (like substitutions, cards, etc.)

  const OverviewTab({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.finalScore,
    required this.statusItems,
  });

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp),
            child: Container(
              color: const Color(0xFFF4F4F5),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  SvgPicture.asset(
                    "assets/main_icons/wistle.svg",
                  ),
                  Container(
                    height: 28,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5D5669).withOpacity(.16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        widget.finalScore,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.statusItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StatusItemsWidget(
                        title: widget.statusItems[index].title,
                        subTitle: widget.statusItems[index].subTitle,
                        icon: widget.statusItems[index].icon,
                        number: widget.statusItems[index].number,
                        isLeft: widget.statusItems[index].isLeft,
                        isShowScore: widget.statusItems[index].isShowScore,
                        score: widget.statusItems[index].score,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 28,
            width: double.infinity,
            padding: const EdgeInsets.all(dp),
            margin: const EdgeInsets.only(top: 10,bottom: 60),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Wrap(
              spacing: 20,
              runSpacing: 10,
              children: <Widget>[
                RowWidget(
                  icon: "assets/main_icons/up_down.svg",
                  title: "Substitution",
                ),
                RowWidget(
                  icon: "assets/main_icons/pink.svg",
                  title: "Red Card",
                ),
                RowWidget(
                  icon: "assets/main_icons/yellow.svg",
                  title: "Yellow Card",
                ),
                RowWidget(
                  icon: "assets/main_icons/corner.svg",
                  title: "Corner",
                ),
                RowWidget(
                  icon: "assets/main_icons/goal.svg",
                  title: "Goal",
                ),
                RowWidget(
                  icon: "assets/main_icons/own_goal.svg",
                  title: "own_goal",
                ),
                RowWidget(
                  icon: "assets/main_icons/penalty.svg",
                  title: "Penalty",
                ),
                RowWidget(
                  icon: "assets/main_icons/miss_penalty.svg",
                  title: "Penalty Missed",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
