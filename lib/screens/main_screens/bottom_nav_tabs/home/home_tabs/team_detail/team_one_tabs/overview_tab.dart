import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../home_widgets.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

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
                    child: const Center(
                      child: Text(
                        "FT 2-0",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
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
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return StatusItemsWidget(
                        title: "In: Evann Guessand",
                        subTitle: "Out: Gaetan Laborde",
                        icon: index == 3
                            ? "assets/main_icons/yellow.svg"
                            : index == 4
                                ? "assets/main_icons/pink.svg"
                                : index == 7
                                    ? "assets/main_icons/goal.svg"
                                    : "assets/main_icons/up_down.svg",
                        number: "86’",
                        isLeft: index.isEven ? true : false,
                        isShowScore: index == 5 ? true : false,
                        score: "2-0",
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
