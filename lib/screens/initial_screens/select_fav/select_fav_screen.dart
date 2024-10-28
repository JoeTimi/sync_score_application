import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/auth_widgets.dart';
import 'package:sync_score_application/screens/main_screens/main_screen.dart';

class SelectFavScreen extends StatefulWidget {
  const SelectFavScreen({super.key});

  @override
  State<SelectFavScreen> createState() => _SelectFavScreenState();
}

class _SelectFavScreenState extends State<SelectFavScreen> {
  void onButtonPressed() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => const MainScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(dp, 30, dp, dp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWellWidget(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/start_icons/back_btn.svg",
                        ),
                      ),
                      InkWellWidget(
                        onTap: onButtonPressed,
                        child: const Text(
                          "Skip",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: mainAppColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Select Favorites",
                          style: TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        LineWidget(
                          bottom: 0,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 47,
                        width: double.infinity,
                        color: const Color(0xFFF1F3F4),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Choose your favorite local teams",
                            style: TextStyle(
                              color: textColorOne,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          border: Border.all(
                            color: const Color(0xFFF1F1F1),
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "#",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF34363D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Team",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF23262D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return TeamItemWidget(
                            index: index.toString(),
                            icon: "assets/start_images/team1.png",
                            name: "Man City",
                            lineColor: index.isEven
                                ? const Color(0xFF3766CF)
                                : const Color(0xFFFF6900),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      ButtonWidget(
                        onPressed: onButtonPressed,
                        text: "Continue",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
