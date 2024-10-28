import 'package:flutter/material.dart';
import 'package:sync_score_application/core/consts.dart';


class PrizeTab extends StatefulWidget {
  const PrizeTab({super.key});

  @override
  State<PrizeTab> createState() => _PrizeTabState();
}

class _PrizeTabState extends State<PrizeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Prediction Contest Rules:",
              style: TextStyle(
                color: Color(0xFF23262D),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Prizes are given seasonally"
              "\n\nSeasonal: Participants Must Have Participated in the 2021 -2022 Season Predictions and Earned Points From Each Game"
              "Contest Date: 30 May 2022 "
              "\n\nEvery 10 Points are Equal To 1 Ticket for Entry Into Lottery. To Participate in the Contest you must be a member of Syncscore and Have An Active Account At the Time of the Draw",
              style: TextStyle(
                color: const Color(0xFF23262D).withOpacity(.80),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Predictions",
              style: TextStyle(
                color: Color(0xFF23262D),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Your Predictions will be displayed on ‘my predictions’ at your account. For every 10 points, you will receive one ticket. Each ticket will give you a chance to win the contest.",
              style: TextStyle(
                color: const Color(0xFF23262D).withOpacity(.80),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "How Scoring Works:",
              style: TextStyle(
                color: Color(0xFF23262D),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "• Correct Prediction = 10 Points\n"
              "• Correct Winner and Point Spread = 7 Points\n"
              "• Correct Winner Only = 5 Points\n"
              "• Incorrect Prediction = 1 Point\n",
              style: TextStyle(
                color: const Color(0xFF23262D).withOpacity(.80),
                fontSize: 10,
                height: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
