import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';

import 'drawer_design_items_widget.dart';

class MainSideMenu extends StatefulWidget {
  const MainSideMenu({
    super.key,
  });

  @override
  State<MainSideMenu> createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 300,
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      color: mainAppColor,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Menu",
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
                      SizedBox(height: 30),
                      DrawerItemWidget(
                        title: "Profile",
                        id: 0,
                        icon: 'assets/main_icons/profile.svg',
                      ),
                      DrawerItemWidget(
                        title: "Change Password",
                        id: 1,
                        icon: 'assets/start_icons/lock.svg',
                      ),
                      DrawerItemWidget(
                        title: "Notification",
                        id: 2,
                        icon: 'assets/main_icons/notification.svg',
                      ),
                      DrawerItemWidget(
                        title: "Support and Feedback",
                        id: 3,
                        icon: 'assets/main_icons/help.svg',
                      ),
                    ],
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/start_icons/logo2.svg",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
