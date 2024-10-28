import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/bottom_nav_tabs/prediction/prediction_screen.dart';

import 'bottom_nav_tabs/favorites/favorites_screen.dart';
import 'bottom_nav_tabs/home/home_screen.dart';
import 'bottom_nav_tabs/news/news_screen.dart';
import 'drawer_tabs/main_side_menu.dart';

class MainScreen extends StatefulWidget {
  final int firstOpenedIndex;

  const MainScreen({
    super.key,
    this.firstOpenedIndex = 0,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  onItemTapped(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    selectedIndex = widget.firstOpenedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomListWidget = [
      HomeScreen(
        scaffoldKey: _scaffoldKey,
      ),
      NewsScreen(
        scaffoldKey: _scaffoldKey,
      ),
      PredictionScreen(
        scaffoldKey: _scaffoldKey,
      ),
      FavoritesScreen(
        scaffoldKey: _scaffoldKey,
      ),
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor:
            selectedIndex == 0 ? const Color(0xFFFAFAFA) : mainAppColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          extendBody: true,
          endDrawer: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.3,
            ),
            child: const MainSideMenu(),
          ),
          backgroundColor: const Color(0xFFFAFAFA),
          body: bottomListWidget[selectedIndex],
          bottomNavigationBar: Container(
            height: 72,
            decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                    spreadRadius: 0,
                    color: blackColor.withOpacity(.10),
                  )
                ]),
            child: Center(
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: blackColor.withOpacity(.48),
                  selectedItemColor: mainAppColor,
                  selectedIconTheme: const IconThemeData(
                    color: mainAppColor,
                  ),
                  elevation: 0,
                  unselectedLabelStyle: TextStyle(
                    color: blackColor.withOpacity(.48),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  selectedLabelStyle: const TextStyle(
                    color: mainAppColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  backgroundColor: Colors.transparent,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: SvgPicture.asset(
                          "assets/bottom_nav_icons/match.svg",
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 0
                                ? mainAppColor
                                : blackColor.withOpacity(.48),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: "Matches",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: SvgPicture.asset(
                          "assets/bottom_nav_icons/news.svg",
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 1
                                ? mainAppColor
                                : blackColor.withOpacity(.48),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: "News",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: SvgPicture.asset(
                          "assets/bottom_nav_icons/prediction.svg",
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 2
                                ? mainAppColor
                                : blackColor.withOpacity(.48),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: "Prediction",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: SvgPicture.asset(
                          "assets/bottom_nav_icons/fav.svg",
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 3
                                ? mainAppColor
                                : blackColor.withOpacity(.48),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      label: "Favorites",
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: onItemTapped,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
