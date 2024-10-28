import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'forgot_two_screen.dart';

class ForgotOneScreen extends StatefulWidget {
  const ForgotOneScreen({super.key});

  @override
  State<ForgotOneScreen> createState() => _ForgotOneScreenState();
}

class _ForgotOneScreenState extends State<ForgotOneScreen> {
  int selectedIndex = -1;

  void onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ForgotTwoScreen(
          selectedIndex: selectedIndex,
        ),
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
                    const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text(
                            "Forget your Password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColorOne,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            "Choose how you want to recover your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF60708F),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    RadioDesignWidget(
                      title: "Email Address",
                      isSelected: selectedIndex == 1 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    RadioDesignWidget(
                      title: "Phone Number",
                      isSelected: selectedIndex == 2 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      onPressed: selectedIndex == -1 ? null : onButtonPressed,
                      disableColor: mainAppColor.withOpacity(.50),
                      text: "Reset Password",
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Remember your password?  ",
                          style: const TextStyle(
                            color: textColorOne,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                              style: const TextStyle(
                                color: mainAppColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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

//radio design widget...
class RadioDesignWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function()? onTap;

  const RadioDesignWidget({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: isSelected ? mainAppColor : whiteColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? mainAppColor
                    : const Color(0xFF333333).withOpacity(.15),
                width: 1,
              ),
            ),
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColorOne.withOpacity(.80),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
