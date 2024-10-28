import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/facorites_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_one_widgets.dart';

class PlayersTab extends StatefulWidget {
  const PlayersTab({super.key});

  @override
  State<PlayersTab> createState() => _PlayersTabState();
}

class _PlayersTabState extends State<PlayersTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            children: <Widget>[
              SizedBox(
                width: 40,
                child: Text(
                  "#",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Text(
                  "Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Goals",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Goals Ratio",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Matches",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA4A4A4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return PlayersItemsWidgets(
                    number: "${index + 1}",
                    name: "Erling Haaland",
                    logo: "assets/start_images/team1.png",
                    city: "Man City",
                    goals: "32",
                    goalsRatio: "10",
                    matches: "8",
                  );
                }),
          ),
        ],
      ),
    );
  }
}
