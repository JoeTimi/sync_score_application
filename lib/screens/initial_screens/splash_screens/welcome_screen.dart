import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/splash_screens/get_started_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: mainAppColor,
        body: Padding(
          padding: const EdgeInsets.all(dp),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  "assets/start_icons/logo1.svg",
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: ButtonWidget(
                    text: "Get Started",
                    borderColor: whiteColor,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const GetStartedScreen(),
                        ),
                      );
                    },
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
