import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/favorites_tabs/leagues_tab.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/favorites/favorites_tabs/teams_tab.dart';

import 'favorites_tabs/fav_matches_tab.dart';
import 'favorites_tabs/players_tab.dart';

class FavoritesScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FavoritesScreen({super.key, required this.scaffoldKey});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          body: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.fromLTRB(dp, 30, dp, dp),
                color: mainAppColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SvgPicture.asset("assets/start_icons/logo2.svg"),
                        SvgPicture.asset(
                          "assets/main_icons/menu.svg",
                          colorFilter: const ColorFilter.mode(
                            whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "FAVORITES",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 32,
                      child: TabBar(
                        labelColor: whiteColor,
                        unselectedLabelColor: Color(0xFF859AA5),
                        dividerHeight: 0,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: whiteColor,
                        indicatorWeight: 1,
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelStyle: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Color(0xFF859AA5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        tabs: [
                          Tab(
                            text: "TEAMS",
                          ),
                          Tab(
                            text: "PLAYERS",
                          ),
                          Tab(
                            text: "LEAGUES",
                          ),
                          Tab(
                            text: "MATCHES",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    TeamsTab(),
                    PlayersTab(),
                    LeaguesTab(),
                    FavMatchesTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
