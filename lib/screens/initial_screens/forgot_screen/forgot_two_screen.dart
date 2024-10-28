import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/core/text_form_field_widget.dart';

import 'forgot_three_screen.dart';

class ForgotTwoScreen extends StatefulWidget {
  final int selectedIndex;

  const ForgotTwoScreen({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<ForgotTwoScreen> createState() => _ForgotTwoScreenState();
}

class _ForgotTwoScreenState extends State<ForgotTwoScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailOrPhoneController = TextEditingController();
  int count = 0;

  void onButtonPressed() {
    if (myFormKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ForgotThreeScreen(
            emailOrPass: myEmailOrPhoneController.text,
            selectedIndex: widget.selectedIndex,
          ),
        ),
      );
    }
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
                child: Form(
                  key: myFormKey,
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
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
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
                                  ? "Enter your Email Address to recover"
                                  : "Enter your Phone Number to recover",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF60708F),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Text(
                        widget.selectedIndex == 1
                            ? "Email Address"
                            : "Phone Number",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColorOne.withOpacity(.90),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: widget.selectedIndex == 1
                            ? "@ayomide@gmail.com"
                            : "+232 6253782",
                        myController: myEmailOrPhoneController,
                        textInputType: widget.selectedIndex == 1
                            ? TextInputType.emailAddress
                            : TextInputType.number,
                        textInputAction: TextInputAction.done,
                        isGiveBottomPadding: false,
                        validator: RequiredValidator(
                          errorText: "*required",
                        ).call,
                      ),
                      const SizedBox(height: 20),
                      ButtonWidget(
                        onPressed: onButtonPressed,
                        text: "Reset Password",
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
