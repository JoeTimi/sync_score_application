import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
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
              Container(
                height: 240,
                width: double.infinity,
                padding: const EdgeInsets.all(dp),
                decoration: const BoxDecoration(
                  color: blackColor,
                  image: DecorationImage(
                    opacity: .70,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/main_images/live.png",
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/main_icons/live.svg"),
                      Expanded(
                        child: Container(
                          height: 3,
                          width: double.infinity,
                          color: const Color(0xFFFF0D00),
                          margin: const EdgeInsets.only(left: 10),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(dp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Match Details",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: blackColor.withOpacity(.48),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const LeagueItemsWidget(
                        ft: "4`",
                        tOneLogo: "assets/main_images/team2.png",
                        tOneName: "Liverpool",
                        tOnePoints: "3",
                        tTwoLogo: "assets/main_images/team1.png",
                        tTwoName: "Aston Villa ",
                        tTwoPoints: "1",
                        isLive: true,
                        isStared: false,
                      ),
                      Expanded(
                        child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          // primary: false,
                          // shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return StatusItemsWidget(
                              title: "In: Evann Guessand",
                              subTitle: "Out: Gaetan Laborde",
                              icon: index == 3
                                  ? "assets/main_icons/yellow.svg"
                                  : index == 4
                                  ? "assets/main_icons/pink.svg"
                                  : index == 7
                                  ? "assets/main_icons/goal.svg"
                                  : "assets/main_icons/up_down.svg",
                              number: "86’",
                              isLeft: index.isEven ? true : false,
                              isShowScore: index == 5 ? true : false,
                              score: "2-0",
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
