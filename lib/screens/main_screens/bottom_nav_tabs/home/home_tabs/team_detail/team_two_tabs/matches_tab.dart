import 'package:flutter/material.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/models/matches_model.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_two_tabs/live_screen.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';

import '../../../home_one_widgets.dart';

import '../../../home_one_widgets.dart';

// // class MatchesTab extends StatefulWidget {
// //   const MatchesTab({super.key});
// //
// //   @override
// //   State<MatchesTab> createState() => _MatchesTabState();
// // }
// //
// // class _MatchesTabState extends State<MatchesTab> {
// //   int selectedStage = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Column(
// //         children: <Widget>[
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 Row(
// //                   children: <Widget>[
// //                     Expanded(
// //                       child: OptionWidget(
// //                         height: 30,
// //                         width: double.infinity,
// //                         title: "Upcoming",
// //                         isSelected: selectedStage == 0 ? true : false,
// //                         onTap: () {
// //                           setState(() {
// //                             selectedStage = 0;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: OptionWidget(
// //                         height: 30,
// //                         width: double.infinity,
// //                         title: "Live",
// //                         isSelected: selectedStage == 1 ? true : false,
// //                         onTap: () {
// //                           setState(() {
// //                             selectedStage = 1;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: OptionWidget(
// //                         height: 30,
// //                         width: double.infinity,
// //                         title: "Finished",
// //                         isRightP: false,
// //                         isSelected: selectedStage == 2 ? true : false,
// //                         onTap: () {
// //                           setState(() {
// //                             selectedStage = 2;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   "Matchday 3 - Summer Olympics Grp. C",
// //                   maxLines: 1,
// //                   overflow: TextOverflow.ellipsis,
// //                   style: TextStyle(
// //                     color: blackColor.withOpacity(.48),
// //                     fontSize: 10,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 if (selectedStage == 0 || selectedStage == 1)
// //                   ListView.builder(
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     primary: false,
// //                     shrinkWrap: true,
// //                     padding: EdgeInsets.zero,
// //                     itemCount: 3,
// //                     itemBuilder: (BuildContext context, int index) {
// //                       return MatchesItemsWidget(
// //                         tOneLogo: "assets/main_images/team2.png",
// //                         tTwoName: "Liverpool",
// //                         tTwoLogo: "assets/main_images/team1.png",
// //                         tOneName: "Chelsea",
// //                         time: "16:00",
// //                         date: "07/31/2024",
// //                         onTap: () {
// //                           if (selectedStage == 1) {
// //                             Navigator.of(context).push(
// //                               MaterialPageRoute(
// //                                 builder: (BuildContext context) =>
// //                                     const LiveScreen(),
// //                               ),
// //                             );
// //                           }
// //                         },
// //                       );
// //                     },
// //                   ),
// //                 if (selectedStage == 2)
// //                   Column(
// //                     children: List.generate(
// //                       3,
// //                       (index) {
// //                         return LeagueItemsWidget(
// //                           ft: "4",
// //                           tOneLogo: "assets/main_images/team2.png",
// //                           tOneName: "Liverpool",
// //                           tOnePoints: "3",
// //                           tTwoLogo: "assets/main_images/team1.png",
// //                           tTwoName: "Aston Villa ",
// //                           tTwoPoints: "1",
// //                           isLive: index == 0 ? true : false,
// //                           isStared: index == 0 ? true : false,
// //                         );
// //                       },
// //                     ),
// //                   ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

import 'package:intl/intl.dart';


class MatchesTab extends StatefulWidget {
  const MatchesTab({super.key});

  @override
  State<MatchesTab> createState() => _MatchesTabState();
}

class _MatchesTabState extends State<MatchesTab> {
  int selectedStage = 0;
  late Future<Welcome> _matchesFuture; // Declare future for matches

  @override
  void initState() {
    super.initState();
    _matchesFuture = fetchMatches(); // Fetch matches when the widget initializes
  }

  Future<Welcome> fetchMatches() async {
    BaseClient client = BaseClient();
    final response = await client.get('/matches'); // Use the correct API endpoint

    if (response != null) {
      return Welcome.fromJson(response); // Convert response to Welcome model
    } else {
      throw Exception('Failed to load matches');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: OptionWidget(
                    height: 30,
                    width: 90.0,
                    title: "Upcoming",
                    isSelected: selectedStage == 0,
                    onTap: () {
                      setState(() {
                        selectedStage = 0;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: OptionWidget(
                    height: 30,
                    // width: double.infinity,
                    width: 120.0,
                    title: "Live",
                    isSelected: selectedStage == 1,
                    onTap: () {
                      setState(() {
                        selectedStage = 1;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: OptionWidget(
                    height: 30,
                    // width: double.infinity,
                    width: 120.0,
                    title: "Finished",
                    isSelected: selectedStage == 2,
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
            Text(
              "Matchday 3 - Summer Olympics Grp. C",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: blackColor.withOpacity(.48),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            if (selectedStage == 0 || selectedStage == 1)
              FutureBuilder<Welcome>(
                future: _matchesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final matches = snapshot.data?.result; // Adjust based on your model
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: matches?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final match = matches![index]; // Ensure matches is not null
                        final formattedDate = match.eventDate != null
                            ? DateFormat('MM/dd/yyyy').format(match.eventDate!)
                            : 'Date Unavailable';
                        return MatchesItemsWidget(
                          tOneLogo: match.homeTeamLogo ?? 'https://default-image-url.com/placeholder.png', // Default image if null
                          tTwoName: match.eventAwayTeam ?? 'Unknown Away Team', // Default text if null
                          tTwoLogo: match.awayTeamLogo ?? 'https://default-image-url.com/placeholder.png', // Default image if null
                          tOneName: match.eventHomeTeam ?? 'Unknown Home Team', // Default text if null
                          time: match.eventTime ?? 'Time Unavailable', // Adjust based on your model
                          date: formattedDate, // Adjust based on your model
                          onTap: () {
                            if (selectedStage == 1) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const LiveScreen(),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No matches found.'));
                  }
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
      ),
    );
  }
}





// class MatchesTab extends StatefulWidget {
//   const MatchesTab({super.key});
//
//   @override
//   State<MatchesTab> createState() => _MatchesTabState();
// }
//
// class _MatchesTabState extends State<MatchesTab> {
//   int selectedStage = 0;
//   late Future<List<Welcome>> _matchesFuture; // Declare future for matches
//
//   @override
//   void initState() {
//     super.initState();
//     _matchesFuture = fetchMatches(); // Fetch matches when the widget initializes
//   }
//
//   Future<List<Welcome>> fetchMatches() async {
//     BaseClient client = BaseClient();
//     final response = await client.get('/matches'); // Use the correct API endpoint
//
//     if (response != null) {
//       // Assuming response contains a list of matches
//       List<dynamic> matchList = response['data']; // Adjust based on your API response structure
//       return matchList.map((match) => Welcome.fromJson(match)).toList();
//     } else {
//       throw Exception('Failed to load matches');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: dp, vertical: dp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: OptionWidget(
//                         height: 30,
//                         width: double.infinity,
//                         title: "Upcoming",
//                         isSelected: selectedStage == 0,
//                         onTap: () {
//                           setState(() {
//                             selectedStage = 0;
//                           });
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: OptionWidget(
//                         height: 30,
//                         width: double.infinity,
//                         title: "Live",
//                         isSelected: selectedStage == 1,
//                         onTap: () {
//                           setState(() {
//                             selectedStage = 1;
//                           });
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: OptionWidget(
//                         height: 30,
//                         width: double.infinity,
//                         title: "Finished",
//                         isSelected: selectedStage == 2,
//                         onTap: () {
//                           setState(() {
//                             selectedStage = 2;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   "Matchday 3 - Summer Olympics Grp. C",
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: blackColor.withOpacity(.48),
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 if (selectedStage == 0 || selectedStage == 1)
//                   FutureBuilder<List<Welcome>>(
//                     future: _matchesFuture,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       } else if (snapshot.hasData) {
//                         final matches = snapshot.data!;
//                         return ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           primary: false,
//                           shrinkWrap: true,
//                           padding: EdgeInsets.zero,
//                           itemCount: matches.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final match = matches[index];
//                             return MatchesItemsWidget(
//                               tOneLogo: match.teamOne.logo, // Adjust based on your model
//                               tTwoName: match.teamTwo.name, // Adjust based on your model
//                               tTwoLogo: match.teamTwo.logo, // Adjust based on your model
//                               tOneName: match.teamOne.name, // Adjust based on your model
//                               time: match.time, // Adjust based on your model
//                               date: match.date, // Adjust based on your model
//                               onTap: () {
//                                 if (selectedStage == 1) {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                       const LiveScreen(),
//                                     ),
//                                   );
//                                 }
//                               },
//                             );
//                           },
//                         );
//                       } else {
//                         return Center(child: Text('No matches found.'));
//                       }
//                     },
//                   ),
//                 if (selectedStage == 2)
//                   Column(
//                     children: List.generate(
//                       3,
//                           (index) {
//                         return LeagueItemsWidget(
//                           ft: "4`",
//                           tOneLogo: "assets/main_images/team2.png",
//                           tOneName: "Liverpool",
//                           tOnePoints: "3",
//                           tTwoLogo: "assets/main_images/team1.png",
//                           tTwoName: "Aston Villa ",
//                           tTwoPoints: "1",
//                           isLive: index == 0 ? true : false,
//                           isStared: index == 0 ? true : false,
//                         );
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
