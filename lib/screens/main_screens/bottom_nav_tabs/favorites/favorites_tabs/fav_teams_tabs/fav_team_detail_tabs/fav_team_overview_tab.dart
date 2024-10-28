import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';

import '../../../../home/home_one_widgets.dart';
import '../../../../home/home_tabs/team_detail/team_detail_two_screen.dart';
import '../../../../home/home_tabs/team_detail/team_two_tabs/live_screen.dart';

class FavTeamOverviewTab extends StatefulWidget {
  const FavTeamOverviewTab({super.key});

  @override
  State<FavTeamOverviewTab> createState() => _FavTeamOverviewTabState();
}

class _FavTeamOverviewTabState extends State<FavTeamOverviewTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Next Match",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF23262D),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          MatchesItemsWidget(
            leagueName: "AFCON",
            tOneLogo: "assets/main_images/team2.png",
            tTwoName: "Liverpool",
            tTwoLogo: "assets/main_images/team1.png",
            tOneName: "Chelsea",
            time: "16:00",
            date: "07/31/2024",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const LiveScreen(),
                ),
              );
            },
          ),
          const Text(
            "Last 2 Matches",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF23262D),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TeamDetailTwoScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
