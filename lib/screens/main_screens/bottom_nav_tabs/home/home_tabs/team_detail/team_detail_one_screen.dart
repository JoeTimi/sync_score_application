import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/base_client.dart';
import 'team_one_tabs/line_up_tab.dart';
import 'team_one_tabs/overview_tab.dart';
import 'team_one_tabs/stats_tab.dart';
import 'team_one_tabs/table_tab.dart';

class TeamDetailOneScreen extends StatefulWidget {
  const TeamDetailOneScreen({super.key});

  @override
  State<TeamDetailOneScreen> createState() => _TeamDetailOneScreenState();
}

class _TeamDetailOneScreenState extends State<TeamDetailOneScreen> {
  bool isStared = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: DefaultTabController(
        length: 4,
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
                    children: <Widget>[
                      Row(
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
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  "English Premier League",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Sunday, 3 September 2023 at 20:00",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: whiteColor.withOpacity(.48),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButtonWidget(
                            onPressed: () {
                              setState(() {
                                isStared = !isStared;
                              });
                            },
                            icon: SvgPicture.asset(
                              isStared
                                  ? "assets/main_icons/pink_star.svg"
                                  : "assets/main_icons/light_star.svg",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    height: 40,
                                    width: 40,
                                    "assets/main_images/team2.png",
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Liverpool",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SvgPicture.asset(
                                    "assets/main_icons/pink_star.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Full Time",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor.withOpacity(.48),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "3-0",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "HT 2-0",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor.withOpacity(.48),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    height: 40,
                                    width: 40,
                                    "assets/main_images/team2.png",
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Aston Villa",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SvgPicture.asset(
                                    "assets/main_icons/light_star.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                        text: "Overview",
                      ),
                      Tab(
                        text: "Lineups",
                      ),
                      Tab(
                        text: "Stats",
                      ),
                      Tab(
                        text: "Table",
                      )
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      OverviewTab(),
                      LineUpTab(),
                      StatsTab(),
                      TableTab(),
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