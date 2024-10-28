import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/create_acc_email_screen.dart';
import 'package:sync_score_application/screens/initial_screens/forgot_screen/forgot_one_screen.dart';
import 'package:sync_score_application/screens/main_screens/main_screen.dart';

import '../../../core/text_form_field_widget.dart';
import 'auth_widgets.dart';
import 'create_pin_screen.dart';
import 'package:sync_score_application/base_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  Future<void> onButtonPressed() async {
    if (myFormKey.currentState!.validate()) {
      var response = await BaseClient().post('/users/login', {'email':myEmailController.text, 'password':myPasswordController.text});
      //
      //   // Navigator.of(context).push(
      //   // MaterialPageRoute(
      //   //   builder: (BuildContext context) => const CreatePinScreen(),
      //   // ),
      // );
        _loginUser();
    }
  }

  // Future<void> _loginUser() async {
  //   try {
  //     var response = await BaseClient().post('/login', {
  //       'email': myEmailController.text,
  //       'password': myPasswordController.text,
  //     });
  //
  //     if (response != null) {
  //       // Handle successful login
  //       debugPrint('Login successful: $response');
  //       Navigator.of(context).push(MaterialPageRoute(
  //         builder: (BuildContext context) => const CreatePinScreen(),
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Login failed: $e');
  //     // Handle login error, e.g., show a Snackbar or alert
  //   }
  // }
  //
  // Future<void> _loginUser() async {
  //   try {
  //     var response = await BaseClient().post('/login', {
  //       'email': myEmailController.text,
  //       'password': myPasswordController.text,
  //     });
  //
  //     if (response != null) {
  //       // Assuming 'success' is part of the response when login is successful
  //       if (response['success'] == true) {
  //         // Successful login
  //         debugPrint('Login successful: $response');
  //         Navigator.of(context).push(MaterialPageRoute(
  //           builder: (BuildContext context) => const CreatePinScreen(),
  //         ));
  //       } else {
  //         // Handle the server error message from response
  //         _showErrorDialog(response['message'] ?? 'Login failed.');
  //       }
  //     }
  //   } catch (e) {
  //     // Catching the exception thrown by the BaseClient and displaying the error
  //     _showErrorDialog(e.toString());
  //   }
  // }

  Future<void> _loginUser() async {
    try {
      var response = await BaseClient().post('/users/login', {
        'email': myEmailController.text,
        'password': myPasswordController.text,
      });

      // Assuming 'token' is part of the response when login is successful
      if (response != null && response['token'] != null) {
        // Successful login
        debugPrint('Login successful: $response');

        // Navigate to the CreatePinScreen after successful login
        Navigator.of(context).push(MaterialPageRoute(
          // builder: (BuildContext context) => const CreatePinScreen(),
          builder: (BuildContext context) => const MainScreen(),
        ));
      } else if (response != null && response['message'] != null) {
        // If the response contains an error message, show it
        _showErrorDialog(response['message']);
      } else {
        // Generic error if no specific message
        _showErrorDialog('Login failed. Please try again.');
      }
    } catch (e) {
      // Catching and displaying the exception thrown by BaseClient
      _showErrorDialog(e.toString());
    }
  }



  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
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
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(dp, 30, dp, 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
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
                                  "Login",
                                  style: TextStyle(
                                    color: textColorOne,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                LineWidget(
                                  bottom: 30,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: myFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormFieldWidget(
                                  hintText: '@gmail.com',
                                  labelText: "Email",
                                  myController: myEmailController,
                                  textInputType: TextInputType.emailAddress,
                                  prefixWidget: SvgPicture.asset(
                                      "assets/start_icons/mail.svg"),
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(errorText: "*required"),
                                      // EmailValidator(
                                      //     errorText: "*incorrect email ")
                                    ],
                                  ).call,
                                ),
                                TextFormFieldWidget(
                                  hintText: "*********",
                                  labelText: "Password",
                                  obscureText: isObscureText,
                                  myController: myPasswordController,
                                  prefixWidget: SvgPicture.asset(
                                      "assets/start_icons/lock.svg"),
                                  textInputAction: TextInputAction.done,
                                  validator:
                                      RequiredValidator(errorText: "*required")
                                          .call,
                                  suffixIcon: IconButtonWidget(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        isObscureText = !isObscureText;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      isObscureText
                                          ? "assets/start_icons/hide.svg"
                                          : "assets/start_icons/un_hide.svg",
                                    ),
                                  ),
                                ),
                                InkWellWidget(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ForgotOneScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forget Password",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: mainAppColor,
                                      color: mainAppColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ButtonWidget(
                                  onPressed: onButtonPressed,
                                  text: "Login",
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Already have an account?  ",
                                      style: const TextStyle(
                                        color: textColorOne,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Fellix",
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      const CreateAccEmailScreen(),
                                                ),
                                              );
                                            },
                                          text: "Sign up",
                                          style: const TextStyle(
                                            color: mainAppColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Fellix",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ButtonWidget(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MainScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        text: "Continue Without Registration",
                        btnColor: whiteColor,
                        borderColor: mainAppColor,
                        textColor: mainAppColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
