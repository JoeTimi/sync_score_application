import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/core/text_form_field_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myPasswordController = TextEditingController();
  TextEditingController myConfirmPasswordController = TextEditingController();
  int count = 0;

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  void onButtonPressed() {
    if (myFormKey.currentState!.validate()) {
      Navigator.of(context).popUntil((_) => count++ >= 3);
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
                      const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                              "New Password?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColorOne,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              "Fill the field to get a new password.",
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
                      Text(
                        "New Password",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColorOne.withOpacity(.90),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: '**********',
                        obscureText: isPasswordObscure,
                        myController: myPasswordController,
                        textInputType: TextInputType.text,
                        suffixIcon: IconButtonWidget(
                          icon: SvgPicture.asset(
                            isPasswordObscure
                                ? "assets/start_icons/hide.svg"
                                : "assets/start_icons/un_hide.svg",
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            });
                          },
                        ),
                        validator:
                            RequiredValidator(errorText: "*required").call,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Password",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColorOne.withOpacity(.90),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: '**********',
                        obscureText: isConfirmPasswordObscure,
                        myController: myConfirmPasswordController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        isGiveBottomPadding: true,
                        suffixIcon: IconButtonWidget(
                          icon: SvgPicture.asset(
                            isConfirmPasswordObscure
                                ? "assets/start_icons/hide.svg"
                                : "assets/start_icons/un_hide.svg",
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordObscure =
                                  !isConfirmPasswordObscure;
                            });
                          },
                        ),
                        validator:
                            RequiredValidator(errorText: "*required").call,
                      ),
                      const SizedBox(height: 20),
                      ButtonWidget(
                        onPressed: onButtonPressed,
                        text: "Confirm",
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
