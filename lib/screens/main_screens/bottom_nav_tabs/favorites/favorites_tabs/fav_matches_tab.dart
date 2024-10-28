import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/facorites_widgets.dart';


class FavMatchesTab extends StatefulWidget {
  const FavMatchesTab({super.key});

  @override
  State<FavMatchesTab> createState() => _FavMatchesTabState();
}

class _FavMatchesTabState extends State<FavMatchesTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(3, (index) {
          return const MatchTimeItemsWidget(
          tOneName: "Chelsea",
          tTwoName: "Liverpool",
          tOneLogo: "assets/start_images/team1.png",
          tTwoLogo: "assets/main_images/team2.png",
          timeDate: "02 JAN\n20:00",
          );
        },),
      ),
    );
  }
}
