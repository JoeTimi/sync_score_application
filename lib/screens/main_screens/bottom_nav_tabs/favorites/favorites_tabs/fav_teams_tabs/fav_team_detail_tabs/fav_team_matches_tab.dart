import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';

import '../../../../home/home_one_widgets.dart';
import '../../../../home/home_tabs/team_detail/team_detail_two_screen.dart';
import '../../../../home/home_tabs/team_detail/team_two_tabs/live_screen.dart';

class FavTeamMatchesTab extends StatefulWidget {
  const FavTeamMatchesTab({super.key});

  @override
  State<FavTeamMatchesTab> createState() => _FavTeamMatchesTabState();
}

class _FavTeamMatchesTabState extends State<FavTeamMatchesTab> {
  int selectedStage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: OptionWidget(
                  height: 30,
                  width: double.infinity,
                  title: "Upcoming",
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
                  title: "Live",
                  isSelected: selectedStage == 1 ? true : false,
                  onTap: () {
                    setState(() {
                      selectedStage = 1;
                    });
                  },
                ),
              ),
              Expanded(
                child: OptionWidget(
                  height: 30,
                  width: double.infinity,
                  title: "Finished",
                  isRightP: false,
                  isSelected: selectedStage == 2 ? true : false,
                  onTap: () {
                    setState(() {
                      selectedStage = 2;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (selectedStage == 0 || selectedStage == 1)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return MatchesItemsWidget(
                  leagueName: "Premier League",
                  tOneLogo: "assets/main_images/team2.png",
                  tTwoName: "Liverpool",
                  tTwoLogo: "assets/main_images/team1.png",
                  tOneName: "Chelsea",
                  time: "16:00",
                  date: "07/31/2024",
                  onTap: () {
                    if (selectedStage == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LiveScreen(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          if (selectedStage == 2)
            Column(
              children: List.generate(
                3,
                (index) {
                  return LeagueItemsWidget(
                    ft: "4`",
                    tOneLogo: "assets/main_images/team2.png",
                    tOneName: "Liverpool",
                    tOnePoints: "3",
                    tTwoLogo: "assets/main_images/team1.png",
                    tTwoName: "Aston Villa ",
                    tTwoPoints: "1",
                    isLive: index == 0 ? true : false,
                    isStared: index == 0 ? true : false,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
