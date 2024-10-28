import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/drawer_tabs/change_pass_screen.dart';
import 'package:sync_score_application/screens/main_screens/drawer_tabs/notification_screen.dart';
import 'package:sync_score_application/screens/main_screens/drawer_tabs/profile_screen.dart';
import 'package:sync_score_application/screens/main_screens/drawer_tabs/support_screen.dart';

class DrawerItemWidget extends StatelessWidget {
  final int id;
  final String title, icon;

  const DrawerItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ProfileScreen(),
            ),
          );
          Navigator.maybePop(context);
        } else if (id == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ChangePassScreen(),
            ),
          );
          Navigator.maybePop(context);
        } else if (id == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const NotificationScreen(),
            ),
          );
          Navigator.maybePop(context);
        } else if (id == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const SupportScreen(),
            ),
          );
          Navigator.maybePop(context);
        }
      },
      child: Container(
        height: 54,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 12),
        child: Center(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                  whiteColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(
                "assets/main_icons/righ_side.svg",
                colorFilter: const ColorFilter.mode(
                  whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
