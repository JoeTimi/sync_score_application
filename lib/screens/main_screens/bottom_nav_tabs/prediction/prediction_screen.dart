import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';

import 'prediction_tabs/my_prediction_tab.dart';
import 'prediction_tabs/my_tickets_tab.dart';
import 'prediction_tabs/prediction_tab.dart';
import 'prediction_tabs/prize_tab.dart';
import 'prediction_tabs/winners_tab.dart';

class PredictionScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const PredictionScreen({super.key, required this.scaffoldKey});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                      "PREDICTION",
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
                            text: "PREDICTION",
                          ),
                          Tab(
                            text: "MY PREDICTIONS",
                          ),
                          Tab(
                            text: "PRIZE & RULES",
                          ),
                          Tab(
                            text: "MY TICKETS",
                          ),
                          Tab(
                            text: "WINNERS",
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
                    PredictionTab(),
                    MyPredictionTab(),
                    PrizeTab(),
                    MyTicketsTab(),
                    WinnersTab(),
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
