import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/facorites_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_one_widgets.dart';

import 'fav_teams_tabs/fav_team_detail_screen.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({super.key});

  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TeamLastStatusWidget(
              logo: "assets/start_images/team1.png",
              name: "Chelsea",
              one: "L",
              two: "D",
              three: "L",
              four: "W",
              five: "W",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const FavTeamDetailScreen(
                      title: "Chelsea",
                      logo: "assets/start_images/team1.png",
                    ),
                  ),
                );
              },
            ),
            const MatchesItemsWidget(
              isBorderTop: false,
              tOneLogo: "assets/main_images/team2.png",
              tTwoName: "Liverpool",
              tTwoLogo: "assets/start_images/team1.png",
              tOneName: "Chelsea",
              time: "16:00",
              date: "07/31/2024",
            ),
            const MatchesItemsWidget(
              isBorderTop: false,
              tOneLogo: "assets/main_images/team2.png",
              tTwoName: "Liverpool",
              tTwoLogo: "assets/start_images/team1.png",
              tOneName: "Chelsea",
              time: "16:00",
              date: "07/31/2024",
            ),
            const SizedBox(height: 20),
            TeamLastStatusWidget(
              logo: "assets/main_images/team2.png",
              name: "Liverpool",
              one: "L",
              two: "D",
              three: "L",
              four: "W",
              five: "W",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const FavTeamDetailScreen(
                      title: "Liverpool",
                      logo: "assets/main_images/team2.png",
                    ),
                  ),
                );
              },
            ),
            const MatchesItemsWidget(
              isBorderTop: false,
              tOneLogo: "assets/main_images/team2.png",
              tTwoName: "Liverpool",
              tTwoLogo: "assets/start_images/team1.png",
              tOneName: "Chelsea",
              time: "16:00",
              date: "07/31/2024",
            ),
            const MatchesItemsWidget(
              isBorderTop: false,
              tOneLogo: "assets/main_images/team2.png",
              tTwoName: "Liverpool",
              tTwoLogo: "assets/start_images/team1.png",
              tOneName: "Chelsea",
              time: "16:00",
              date: "07/31/2024",
            ),
          ],
        ),
      ),
    );
  }
}

