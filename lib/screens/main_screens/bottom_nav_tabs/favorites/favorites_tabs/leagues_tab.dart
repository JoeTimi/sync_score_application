import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../home/home_tabs/team_detail/team_detail_two_screen.dart';
import '../../home/home_widgets.dart';

class LeaguesTab extends StatefulWidget {
  const LeaguesTab({super.key});

  @override
  State<LeaguesTab> createState() => _LeaguesTabState();
}

class _LeaguesTabState extends State<LeaguesTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TitleWidget(
            logo: "assets/main_images/team1.png",
            name: "Premier League",
            flag: "assets/main_icons/flag1.svg",
            countryName: "England",
            lastIcon: "assets/main_icons/notification.svg",
          ),
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
