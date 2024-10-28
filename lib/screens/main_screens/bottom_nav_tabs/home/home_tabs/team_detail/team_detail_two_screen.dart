import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_two_tabs/matches_tab.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_two_tabs/table_two_tab.dart';

import 'team_two_tabs/news_tab.dart';

class TeamDetailTwoScreen extends StatefulWidget {
  const TeamDetailTwoScreen({super.key});

  @override
  State<TeamDetailTwoScreen> createState() => _TeamDetailTwoScreenState();
}

class _TeamDetailTwoScreenState extends State<TeamDetailTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFAFAFA),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  color: mainAppColor,
                  padding: const EdgeInsets.fromLTRB(dp, 10, dp, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWellWidget(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 50,
                          height: 30,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              height: 10,
                              width: 6,
                              "assets/main_icons/left_side.svg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/main_icons/cup.svg",
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "International",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor.withOpacity(.48),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "English Premier League",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ButtonWidget(
                        text: "Follow",
                        height: 43,
                        btnColor: mainAppColor,
                        borderColor: whiteColor.withOpacity(.20),
                        borderRadius: 30,
                        borderWidth: 2,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                  child: TabBar(
                    labelColor: mainAppColor,
                    unselectedLabelColor: blackColor.withOpacity(.48),
                    dividerHeight: 0,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: mainAppColor,
                    indicatorWeight: 1,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    // labelPadding: EdgeInsets.zero,
                    labelStyle: const TextStyle(
                      color: mainAppColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: blackColor.withOpacity(.48),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),

                    tabs: const [
                      Tab(
                        text: "Table",
                      ),
                      Tab(
                        text: "Matches",
                      ),
                      Tab(
                        text: "News",
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      TableTwoTab(),
                      MatchesTab(),
                      NewsTab(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
