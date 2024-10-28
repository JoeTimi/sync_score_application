import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_two_tabs/table_two_tab.dart';

import '../../../home/home_tabs/team_detail/team_two_tabs/news_tab.dart';
import 'fav_team_detail_tabs/fav_team_matches_tab.dart';
import 'fav_team_detail_tabs/fav_team_overview_tab.dart';
import 'fav_team_detail_tabs/fav_team_players_tab.dart';

class FavTeamDetailScreen extends StatefulWidget {
  final String logo, title;

  const FavTeamDetailScreen(
      {super.key, required this.logo, required this.title});

  @override
  State<FavTeamDetailScreen> createState() => _FavTeamDetailScreenState();
}

class _FavTeamDetailScreenState extends State<FavTeamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFAFAFA),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWellWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    color: mainAppColor,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          InkWellWidget(
                            child: Padding(
                              padding: const EdgeInsets.all(dp),
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
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  height: 16,
                                  width: 16,
                                  widget.logo,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    widget.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: whiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    labelStyle: const TextStyle(
                      color: mainAppColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: blackColor.withOpacity(.48),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: const [
                      Tab(
                        text: "Overview",
                      ),
                      Tab(
                        text: "Matches",
                      ),
                      Tab(
                        text: "News",
                      ),
                      Tab(
                        text: "Table",
                      ),
                      Tab(
                        text: "Players",
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      FavTeamOverviewTab(),
                      FavTeamMatchesTab(),
                      NewsTab(),
                      TableTwoTab(
                        isShowDrop: true,
                      ),
                      FavTeamPlayerTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
