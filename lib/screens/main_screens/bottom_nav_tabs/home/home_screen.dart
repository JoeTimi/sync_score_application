import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/auth_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_detail_two_screen.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_two_tabs/matches_tab.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home_tabs/team_detail/team_detail_one_screen.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeScreen({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  int selectedIndex = 0;
  bool isShowFilter = false;
  bool isShowCalendar = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(dp, 30, dp, dp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset("assets/main_icons/logo.svg"),
                      const TimeDropWidget(),
                      InkWellWidget(
                        onTap: (){
                          widget.scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: SvgPicture.asset("assets/main_icons/menu.svg"),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: dp),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF746C82).withOpacity(.24),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: DefaultTabController(
                            length: 4,
                            child: Container(
                              height: 30,
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF5D5669).withOpacity(.16),
                              ),
                              child: TabBar(
                                labelColor: mainAppColor,
                                unselectedLabelColor:
                                    blackColor.withOpacity(.48),
                                dividerHeight: 0,
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                padding: EdgeInsets.zero,
                                indicatorPadding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.zero,
                                labelStyle: const TextStyle(
                                  color: mainAppColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                                unselectedLabelStyle: TextStyle(
                                  color: blackColor.withOpacity(.48),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: whiteColor.withOpacity(.80),
                                ),
                                tabs: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Tab(
                                      text: "All",
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Tab(
                                      text: "LIVE",
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Tab(
                                      text: "Upcoming",
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Tab(
                                      text: "Finished",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        IconButtonWidget(
                          onPressed: () {
                            setState(() {
                              isShowCalendar = true;
                            });
                          },
                          icon: SvgPicture.asset(
                              "assets/main_icons/calendar.svg"),
                        ),
                        IconButtonWidget(
                          onPressed: () {
                            setState(() {
                              isShowFilter = true;
                            });
                          },
                          icon:
                              SvgPicture.asset("assets/main_icons/a_to_z.svg"),
                        ),
                        SvgPicture.asset("assets/main_icons/search.svg"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: dp),
                      child: Column(
                        children: <Widget>[
                          const TitleWidget(
                            logo: "assets/main_images/team1.png",
                            name: "Premier League",
                            flag: "assets/main_icons/flag1.svg",
                            countryName: "England",
                          ),
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const TeamDetailOneScreen(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const TitleWidget(
                            logo: "assets/main_images/team1.png",
                            name: "Premier League",
                            flag: "assets/main_icons/flag1.svg",
                            countryName: "England",
                          ),
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const TeamDetailTwoScreen(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const TitleWidget(
                            logo: "assets/main_images/team1.png",
                            name: "Premier League",
                            flag: "assets/main_icons/flag1.svg",
                            countryName: "England",
                          ),
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const TeamDetailOneScreen(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (isShowFilter)
              Container(
                color: const Color(0xFFFAFAFA),
                padding: const EdgeInsets.all(dp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWellWidget(
                      onTap: () {
                        setState(() {
                          isShowFilter = false;
                        });
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Done",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainAppColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const LineWidget(),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Group by",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: blackColor.withOpacity(.48),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              DefaultTabController(
                                length: 2,
                                child: Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF5D5669)
                                        .withOpacity(.16),
                                  ),
                                  child: TabBar(
                                    labelColor: mainAppColor,
                                    unselectedLabelColor:
                                        blackColor.withOpacity(.48),
                                    dividerHeight: 0,
                                    padding: EdgeInsets.zero,
                                    labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelStyle: const TextStyle(
                                      color: mainAppColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                      color: blackColor.withOpacity(.48),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: whiteColor.withOpacity(.80),
                                    ),
                                    tabs: const [
                                      Tab(
                                        text: "Leagues",
                                      ),
                                      Tab(
                                        text: "Countries",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Sort by",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: blackColor.withOpacity(.48),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              DefaultTabController(
                                length: 2,
                                child: Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFF5D5669)
                                        .withOpacity(.16),
                                  ),
                                  child: TabBar(
                                    labelColor: mainAppColor,
                                    unselectedLabelColor:
                                        blackColor.withOpacity(.48),
                                    dividerHeight: 0,
                                    padding: EdgeInsets.zero,
                                    labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelStyle: const TextStyle(
                                      color: mainAppColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                      color: blackColor.withOpacity(.48),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: whiteColor.withOpacity(.80),
                                    ),
                                    tabs: const [
                                      Tab(
                                        text: "Ascending",
                                      ),
                                      Tab(
                                        text: "Descending",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (isShowCalendar)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color: mainAppColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Today",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWellWidget(
                          onTap: () {
                            setState(() {
                              isShowCalendar = false;
                            });
                          },
                          child: const Text(
                            "Cancel",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const LineWidget(),
                    TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekHeight: 40,
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        weekendStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonShowsNext: false,
                        formatButtonVisible: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        titleTextStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w600,
                        ),
                        headerMargin: EdgeInsets.only(bottom: 20),
                        leftChevronMargin: EdgeInsets.zero,
                        leftChevronPadding: EdgeInsets.zero,
                        rightChevronMargin: EdgeInsets.zero,
                        rightChevronPadding: EdgeInsets.zero,
                        titleCentered: true,
                      ),
                      calendarStyle: const CalendarStyle(
                        outsideDaysVisible: false,
                        defaultTextStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        weekendTextStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        selectedTextStyle: TextStyle(
                          color: mainAppColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        todayTextStyle: TextStyle(
                          color: mainAppColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        weekNumberTextStyle: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                          fontFamily: "Fellix",
                          fontWeight: FontWeight.w400,
                        ),
                        defaultDecoration: BoxDecoration(
                          color: mainAppColor,
                        ),
                        weekendDecoration: BoxDecoration(
                          color: mainAppColor,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      currentDay: selectedDate,
                      pageJumpingEnabled: true,
                      selectedDayPredicate: (day) {
                        return isSameDay(selectedDate, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          selectedDate = selectedDay;
                        });
                      },
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: selectedDate,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

