import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/auth_widgets.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_tabs/team_detail/team_detail_two_screen.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/home/home_widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home_tabs/team_detail/team_detail_one_screen.dart';
import 'package:sync_score_application/models/fixtures_model.dart';
import 'package:sync_score_application/fixtures_service.dart';


class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeScreen({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();
  bool isLoading = true;
  List<Result> fixturesList = [];
  final FixtureService fixtureService = FixtureService();

  late TabController _tabController;
  bool isShowCalendar = false;
  bool isShowFilter = false;

  @override
  void initState() {
    super.initState();
    fetchFixtures();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> fetchFixtures() async {
    try {
      Fixtures fixtures = await fixtureService.fetchFixtures();
      setState(() {
        fixturesList = fixtures.result ?? [];
        isLoading = false;
      });
    } catch (error, stackTrace) {
      debugPrint('Error fetching fixtures: $error');
      debugPrint('Stack trace: $stackTrace');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onTabChanged() {
    setState(() {
      debugPrint('Current tab index ${_tabController.index}');
    });
  }

  List<Result> getFilteredFixtures() {
    switch (_tabController.index) {
      case 0: // "All"
        return fixturesList;
      case 1: // "Live"
        return fixturesList.where((fixture) => fixture.eventLive == '1' || fixture.eventLive == 'Live').toList();
      case 2: // "Upcoming"
        return fixturesList.where((fixture) => fixture.eventStatus == 'Upcoming' || fixture.eventStatus == 'waiting').toList();
        // return fixturesList.where((fixture) => fixture.eventStatus == 'Upcoming').toList();
      case 3: // "Finished"
        return fixturesList.where((fixture) => fixture.eventStatus == 'Finished').toList();
      default:
        return fixturesList;
    }
  }

  // List<Result> getFilteredFixtures() {
  //   switch (_tabController.index) {
  //     case 0: // "All"
  //       return fixturesList;
  //     case 1: // "Live"
  //       fixturesList.forEach((fixture) {
  //         debugPrint('Fixture Live Status: ${fixture.eventLive}');
  //       });
  //       final liveFixtures = fixturesList.where((fixture) => fixture.eventLive == '1').toList();
  //       debugPrint('Live Fixtures: ${liveFixtures.length}');
  //       return liveFixtures;
  //     case 2: // "Upcoming"
  //       fixturesList.forEach((fixture) {
  //         debugPrint('Fixture Status: ${fixture.eventStatus}');
  //       });
  //       final upcomingFixtures = fixturesList.where((fixture) => fixture.eventStatus == 'waiting').toList();
  //       debugPrint('Upcoming Fixtures: ${upcomingFixtures.length}');
  //       return upcomingFixtures;
  //     case 3: // "Finished"
  //       final finishedFixtures = fixturesList.where((fixture) => fixture.eventStatus == 'Finished').toList();
  //       debugPrint('Finished Fixtures: ${finishedFixtures.length}');
  //       return finishedFixtures;
  //     default:
  //       return fixturesList;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Result>> fixturesByLeague = {};

    // Filter the fixtures based on the selected tab
    List<Result> filteredFixtures = getFilteredFixtures();

    for (var fixture in filteredFixtures) {
      final leagueName = fixture.leagueName ?? 'Unknown League';
      fixturesByLeague.putIfAbsent(leagueName, () => []).add(fixture);
    }
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
              onTap: () {
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
                      controller: _tabController,
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
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: dp),
            child: Column(
              children: fixturesByLeague.entries.map<Widget>((entry) {
                final leagueName = entry.key;
                final leagueFixtures = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      logo: leagueFixtures.first.leagueLogo ?? 'assets/default_logo.png' ,
                      name: leagueName,
                      flag: leagueFixtures.first.countryLogo ?? 'assets/default_flag.png',
                      countryName: leagueFixtures.first.countryName ?? 'Unknown Country',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TeamDetailTwoScreen(
                                  leagueName: leagueName,
                                  leagueLogo: leagueFixtures.first.leagueLogo ?? 'assets/default_logo.png',
                                  countryName: leagueFixtures.first.countryName ?? 'Unknown country',
                                  countryLogo: leagueFixtures.first.countryLogo ?? 'assets/default_flag.png',
                                ),
                          ),
                        );
                      },
                    ),
                    ...leagueFixtures.map((fixture) {
                      // Convert the enum value to a score string using eventFinalResultValues
                      String eventFinalResultScore = eventFinalResultValues.reverse[fixture.eventFinalResult] ?? "0 - 0";

                      List<String> scores = eventFinalResultScore.split(" - ");

                      // Debugging logs
                      // debugPrint('Event Final Result: $eventFinalResult');
                      debugPrint('Parsed Scores: $scores');

                      // Ensure the list has exactly two parts (home and away scores)
                      int homePoints = 0;
                      int awayPoints = 0;

                      if (scores.length == 2) {
                        homePoints = int.tryParse(scores[0].trim()) ?? 0;
                        awayPoints = int.tryParse(scores[1].trim()) ?? 0;
                      } else {
                        debugPrint('Score parsing failed for fixture: ${fixture.eventHomeTeam} vs ${fixture.eventAwayTeam}');
                      }


                      return LeagueItemsWidget(
                        ft: fixture.eventFtResult.toString(),
                        tOneLogo: fixture.homeTeamLogo ?? 'assets/default_logo.png',
                        tOneName: fixture.eventHomeTeam ?? 'Home Team',
                        tTwoLogo: fixture.awayTeamLogo ?? 'assets/default_logo.png',
                        tTwoName: fixture.eventAwayTeam ?? 'Away Team',
                        tOnePoints: homePoints.toString(),
                        tTwoPoints: awayPoints.toString(),
                        // tOnePoints: (fixture.homeGoals ?? 'N/A').toString(),
                        // tTwoPoints: (fixture.awayGoals ?? 'N/A').toString(),
                        isLive: fixture.eventLive == '1',
                        isStared: false,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => TeamDetailOneScreen(
                                homeTeamName: fixture.eventHomeTeam ?? 'Home Team',
                                awayTeamName: fixture.eventAwayTeam ?? 'Away Team',
                                homeTeamLogo: fixture.homeTeamLogo ?? 'assets/default_logo.png',
                                awayTeamLogo: fixture.awayTeamLogo ?? 'assets/default_logo.png',
                                finalScore: eventFinalResultScore,
                                leagueName: fixture.leagueName ?? 'League Name',
                                statusItems: getStatusItems(fixture), // Assuming you want to show the final score),

                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                );
              }).toList(),
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
    );}


  List<StatusItem> getStatusItems(Result fixture) {
    // This function should return a list of StatusItem based on the match events
    List<StatusItem> items = [];

    // Add logic to populate items based on the fixture data
    // For example:
    items.add(StatusItem(
      title: "Substitution",
      subTitle: "${fixture.eventHomeTeam} substituted a player.",
      icon: "assets/main_icons/up_down.svg",
      number: "86’",
      isLeft: true,
      isShowScore: false,
      score: "",
    ));
    // Add more items based on actual match events...

    return items;
  }

}

class StatusItem {
  final String title;
  final String subTitle;
  final String icon;
  final String number;
  final bool isLeft;
  final bool isShowScore;
  final String score;

  StatusItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.number,
    required this.isLeft,
    required this.isShowScore,
    required this.score,
  });
}