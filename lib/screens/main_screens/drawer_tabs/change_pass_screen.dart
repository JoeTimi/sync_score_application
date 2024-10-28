import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/core/text_form_field_widget.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({
    super.key,
  });

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myOldPassController = TextEditingController();
  TextEditingController myConfirmPassController = TextEditingController();
  TextEditingController myNewPassController = TextEditingController();
  bool isOldObscureText = true;
  bool isNewObscureText = true;
  bool isConfirmObscureText = true;

  @override
  void dispose() {
    myOldPassController.dispose();
    myConfirmPassController.dispose();
    myNewPassController.dispose();
    super.dispose();
  }

  void onButtonPressed() {
    if (myFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: mainAppColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWellWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  color: mainAppColor,
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.symmetric(horizontal: dp),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        InkWellWidget(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              height: 10,
                              width: 6,
                              "assets/main_icons/left_side.svg",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Change Password",
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
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(dp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Old Password",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF81809E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldWidget(
                          hintText: "*********",
                          obscureText: isOldObscureText,
                          myController: myOldPassController,
                          validator:
                              RequiredValidator(errorText: "*required").call,
                          suffixIcon: IconButtonWidget(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isOldObscureText = !isOldObscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              isOldObscureText
                                  ? "assets/start_icons/hide.svg"
                                  : "assets/start_icons/un_hide.svg",
                            ),
                          ),
                        ),
                        const Text(
                          "New Password",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF81809E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldWidget(
                          hintText: "*********",
                          obscureText: isNewObscureText,
                          myController: myNewPassController,
                          validator:
                              RequiredValidator(errorText: "*required").call,
                          suffixIcon: IconButtonWidget(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isNewObscureText = !isNewObscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              isNewObscureText
                                  ? "assets/start_icons/hide.svg"
                                  : "assets/start_icons/un_hide.svg",
                            ),
                          ),
                        ),
                        const Text(
                          "Confirm Password",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF81809E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldWidget(
                          hintText: "*********",
                          obscureText: isConfirmObscureText,
                          myController: myConfirmPassController,
                          validator:
                              RequiredValidator(errorText: "*required").call,
                          suffixIcon: IconButtonWidget(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isConfirmObscureText = !isConfirmObscureText;
                              });
                            },
                            icon: SvgPicture.asset(
                              isConfirmObscureText
                                  ? "assets/start_icons/hide.svg"
                                  : "assets/start_icons/un_hide.svg",
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        ButtonWidget(
                          onPressed: onButtonPressed,
                          text: "Save Changes",
                        ),
                      ],
                    ),
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
