import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/create_acc_email_screen.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/login_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF17191C),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF17191C),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: blackColor.withOpacity(.20),
                image: const DecorationImage(
                  opacity: .70,
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/start_images/bg1.png",
                  ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                "assets/start_icons/logo2.svg",
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 76, left: dp, right: dp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ButtonWidget(
                      text: "Create Account",
                      btnColor: whiteColor,
                      borderColor: whiteColor,
                      textColor: blackColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CreateAccEmailScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      text: "Sign In",
                      btnColor: Colors.transparent,
                      borderColor: whiteColor,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
