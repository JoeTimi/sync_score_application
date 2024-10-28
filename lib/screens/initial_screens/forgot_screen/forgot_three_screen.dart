import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

import 'new_password_screen.dart';

class ForgotThreeScreen extends StatefulWidget {
  final int selectedIndex;

  final String emailOrPass;

  const ForgotThreeScreen({
    super.key,
    required this.selectedIndex,
    required this.emailOrPass,
  });

  @override
  State<ForgotThreeScreen> createState() => _ForgotThreeScreenState();
}

class _ForgotThreeScreenState extends State<ForgotThreeScreen> {
  void onButtonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const NewPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(dp, 20, dp, dp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWellWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/start_icons/back_btn.svg",
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          const Text(
                            "Forget your Password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColorOne,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            widget.selectedIndex == 1
                                ? "We sent a password reset link to ${widget.emailOrPass}. Click on the button below to view the email."
                                : "We sent a password reset link to ${widget.emailOrPass}. Click on the button below to view the phone number.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF60708F),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                    ButtonWidget(
                      onPressed: onButtonPressed,
                      text:   widget.selectedIndex == 1
                          ?"View Email":"View Phone Number"
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
