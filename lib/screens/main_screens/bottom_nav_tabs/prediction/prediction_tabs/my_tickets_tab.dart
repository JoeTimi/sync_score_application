import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';

import '../prediction_widgets.dart';

class MyTicketsTab extends StatefulWidget {
  const MyTicketsTab({super.key});

  @override
  State<MyTicketsTab> createState() => _MyTicketsTabState();
}

class _MyTicketsTabState extends State<MyTicketsTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                PredictionPointWidget(
                  title: "ALL TICKETS",
                  points: "0",
                ),
                PredictionPointWidget(
                  title: "ACTIVE",
                  points: "0",
                ),
                PredictionPointWidget(
                  title: "EXPIRED",
                  points: "0",
                  isRightPadding: false,
                ),
              ],
            ),
            SizedBox(height: 20),
            PredictionItemsWidget(
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
