import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/main_screens/main_screen.dart';
import '../select_fav/select_fav_screen.dart';
import 'auth_widgets.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myOTPController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  Future<void> _storePin(String pin) async {
    await _secureStorage.write(key: 'user_pin', value: pin);
    debugPrint('pin stored successfully');
  }

  Future<void> _retrievePin() async {
    String? storedPin = await _secureStorage.read(key: 'user_pin');
    if (storedPin != null) {
      debugPrint('Stored Pin: $storedPin');
    }
  }
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> onButtonPressed() async {
    if (myFormKey.currentState!.validate()) {
      String pin = myOTPController.text;
      await _storePin(pin);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          // builder: (BuildContext context) => const MainScreen(),
          builder: (BuildContext context) => const SelectFavScreen(),
        ),
        (route) => false,
      );
    } else {
      errorController.add(ErrorAnimationType.shake);
      _showErrorDialog('Please enter a valid 6-digit pin');
    }
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
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(dp, 30, dp, 60),
                  child: Column(
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
                      const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Security Pin",
                              style: TextStyle(
                                color: textColorOne,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            LineWidget(
                              bottom: 20,
                            ),
                            Text(
                              "Create your security pin",
                              style: TextStyle(
                                color: textColorOne,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "We will require this pin to process your Transactions",
                              style: TextStyle(
                                color: textColorOne,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: myFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                child: PinCodeTextField(
                                  length: 6,
                                  autoUnfocus: true,
                                  enablePinAutofill: true,
                                  // onSubmitted: (_) {
                                  //   onButtonPressed();
                                  // },
                                  textStyle: const TextStyle(
                                    color: textColorOne,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(errorText: "*required"),
                                      MinLengthValidator(6,
                                          errorText: "*6 digit required"),
                                    ],
                                  ).call,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 52,
                                    fieldWidth: 43,
                                    activeFillColor: whiteColor,
                                    activeColor: const Color(0xFF81809E)
                                        .withOpacity(.30),
                                    inactiveColor: const Color(0xFF81809E)
                                        .withOpacity(.30),
                                    inactiveFillColor: whiteColor,
                                    selectedColor: const Color(0xFF81809E)
                                        .withOpacity(.30),
                                    errorBorderColor: alertColor,
                                    selectedFillColor: whiteColor,
                                    fieldOuterPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 0),
                                    borderWidth: 1,
                                  ),
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  backgroundColor: whiteColor,
                                  enableActiveFill: true,
                                  errorAnimationController: errorController,
                                  controller: myOTPController,
                                  // onCompleted: (value) {
                                  //   onButtonPressed();
                                  // },
                                  cursorColor: blackColor,
                                  onChanged: (value) {},
                                  appContext: context,
                                ),
                              ),
                              // Center(
                              //   child: TextButton(
                              //     onPressed: () {},
                              //     child: const Text(
                              //       "Resend Code",
                              //       style: TextStyle(
                              //         color: textColorOne,
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.w600,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const Spacer(),
                              ButtonWidget(
                                onPressed: onButtonPressed,
                                text: "Continue",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
