import 'package:flutter/material.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/models/team_model.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/facorites_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_one_widgets.dart';

import 'fav_teams_tabs/fav_team_detail_screen.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({super.key});


  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  List<Datum> teams = []; // Store fetched teams here
  final BaseClient _client = BaseClient();
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    try {
      final response = await _client.get('/teams'); // Adjust endpoint if necessary
      final welcome = Welcome.fromJson(response);
      setState(() {
        teams = welcome.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch teams: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
        child: isLoading
            ? const Center(child: CircularProgressIndicator()) // Loading indicator
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: teams.map((team) {
            return Column(
              children: [
                TeamLastStatusWidget(
                  logo: team.imagePath ?? 'assets/start_images/team1.png',
                  name: team.name ?? 'Unknown Team',
                  one: "L", // Replace with actual match data if available
                  two: "D",
                  three: "L",
                  four: "W",
                  five: "W",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => FavTeamDetailScreen(
                          title: team.name ?? "Unknown Team",
                          logo: team.imagePath ?? "assets/start_images/team1.png",
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),

        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   // children: <Widget>[
        //   //   // TeamLastStatusWidget(
        //   //   //   logo: "assets/start_images/team1.png",
        //   //   //   name: "Chelsea",
        //   //   //   one: "L",
        //   //   //   two: "D",
        //   //   //   three: "L",
        //   //   //   four: "W",
        //   //   //   five: "W",
        //   //   //   // onTap: () {
        //   //   //   //   Navigator.of(context).push(
        //   //   //   //     MaterialPageRoute(
        //   //   //   //       builder: (BuildContext context) =>
        //   //   //   //           const FavTeamDetailScreen(
        //   //   //   //         title: "Chelsea",
        //   //   //   //         logo: "assets/start_images/team1.png",
        //   //   //   //       ),
        //   //   //   //     ),
        //   //   //   //   );
        //   //   //   // },
        //   //   // ),
        //   //   // const MatchesItemsWidget(
        //   //   //   isBorderTop: false,
        //   //   //   tOneLogo: "assets/main_images/team2.png",
        //   //   //   tTwoName: "Liverpool",
        //   //   //   tTwoLogo: "assets/start_images/team1.png",
        //   //   //   tOneName: "Chelsea",
        //   //   //   time: "16:00",
        //   //   //   date: "07/31/2024",
        //   //   // ),
        //   //   // const MatchesItemsWidget(
        //   //   //   isBorderTop: false,
        //   //   //   tOneLogo: "assets/main_images/team2.png",
        //   //   //   tTwoName: "Liverpool",
        //   //   //   tTwoLogo: "assets/start_images/team1.png",
        //   //   //   tOneName: "Chelsea",
        //   //   //   time: "16:00",
        //   //   //   date: "07/31/2024",
        //   //   // ),
        //   //   // const SizedBox(height: 20),
        //   //   // TeamLastStatusWidget(
        //   //   //   logo: "assets/main_images/team2.png",
        //   //   //   name: "Liverpool",
        //   //   //   one: "L",
        //   //   //   two: "D",
        //   //   //   three: "L",
        //   //   //   four: "W",
        //   //   //   five: "W",
        //   //   //   onTap: () {
        //   //   //     Navigator.of(context).push(
        //   //   //       MaterialPageRoute(
        //   //   //         builder: (BuildContext context) =>
        //   //   //             const FavTeamDetailScreen(
        //   //   //           title: "Liverpool",
        //   //   //           logo: "assets/main_images/team2.png",
        //   //   //         ),
        //   //   //       ),
        //   //   //     );
        //   //   //   },
        //   //   // ),
        //   //   // const MatchesItemsWidget(
        //   //   //   isBorderTop: false,
        //   //   //   tOneLogo: "assets/main_images/team2.png",
        //   //   //   tTwoName: "Liverpool",
        //   //   //   tTwoLogo: "assets/start_images/team1.png",
        //   //   //   tOneName: "Chelsea",
        //   //   //   time: "16:00",
        //   //   //   date: "07/31/2024",
        //   //   // ),
        //   //   // const MatchesItemsWidget(
        //   //   //   isBorderTop: false,
        //   //   //   tOneLogo: "assets/main_images/team2.png",
        //   //   //   tTwoName: "Liverpool",
        //   //   //   tTwoLogo: "assets/start_images/team1.png",
        //   //   //   tOneName: "Chelsea",
        //   //   //   time: "16:00",
        //   //   //   date: "07/31/2024",
        //   //   // ),
        //   // ],
        // ),
      ),
    );
  }
}

