import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/base_client.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';

import '../../../core/text_form_field_widget.dart';
import '../select_fav/select_fav_screen.dart';
import 'auth_widgets.dart';
import 'create_pin_screen.dart';

class CreateAccPassScreen extends StatefulWidget {
  final String email;
  final String name;
  final String address;
  final String dob;


  const CreateAccPassScreen({super.key, required this.email, required this.name, required this.address, required this.dob,});

  @override
  State<CreateAccPassScreen> createState() => _CreateAccPassScreenState();
}

class _CreateAccPassScreenState extends State<CreateAccPassScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myPasswordController = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    myPasswordController.dispose();
    super.dispose();
  }

  // void onButtonPressed() {
  //   if (myFormKey.currentState!.validate()) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const SelectFavScreen(),
  //       ),
  //     );
  //   }
  // }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Registration Error"),
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

  // Function to handle the Register API call
  Future<void> registerUser() async {
    String email = widget.email; // Get the email from the previous screen
    String password = myPasswordController.text; // Get the entered password
    String name = widget.name; // Get the name from the previous screen
    String address = widget.address; // Get the address from the previous screen
    String dob = widget.dob; // Get the date of birth from the previous screen

    // Create the object to pass to the API
    Map<String, String> registrationData = {
      "name" : name,
      "email": email,
      "password": password,
      "address": address,
      "dob": dob,
    };

    try {
      // Call the register API using your BaseClient
      var response = await BaseClient().post('/users/register', registrationData);

      // Handle the response
      if (response != null && response is Map<String, dynamic> && response['success'] == true) {
        // Navigate to the next screen if registration is successful
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // builder: (BuildContext context) => const SelectFavScreen(),
            builder: (BuildContext context) => const CreatePinScreen(),
          ),
        );
      } else if (response is Map<String, dynamic>) {
        _showErrorDialog(response['message'] ?? "Registration failed.");
      } else {
        _showErrorDialog("Unexpected response format.");
      }
    } catch (e) {
      _showErrorDialog("Error during registration: $e");
      debugPrint("Registration failed: $e");
    }
  }

  // Function called when the button is pressed
  void onButtonPressed() {
    if (myFormKey.currentState!.validate()) {
      // If the form is valid, call the register API
      registerUser();
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(dp, 30, dp, dp),
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
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          "Create an Account",
                          style: TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const LineWidget(
                          bottom: 20,
                        ),
                        Text(
                          widget.email,
                          style: const TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text(
                          widget.address,
                          style: const TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text(
                          widget.dob,
                          style: const TextStyle(
                            color: textColorOne,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
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
                          hintText: "*********",
                          labelText: "Password",
                          obscureText: isObscureText,
                          myController: myPasswordController,
                          prefixWidget:
                              SvgPicture.asset("assets/start_icons/lock.svg"),
                          textInputAction: TextInputAction.done,
                          validator:
                              RequiredValidator(errorText: "*required").call,
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
                        const LineWidget(
                          bottom: 15,
                          top: 20,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: "By creating an account, i agree to the ",
                            style: TextStyle(
                              color: textColorTwo,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Fellix",
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Terms of Use",
                                style: TextStyle(
                                  color: mainAppColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Fellix",
                                ),
                              ),
                              TextSpan(
                                text: " and acknowledge that I have read the ",
                                style: TextStyle(
                                  color: textColorTwo,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Fellix",
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy ",
                                style: TextStyle(
                                  color: mainAppColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Fellix",
                                ),
                              ),
                              TextSpan(
                                text: "and",
                                style: TextStyle(
                                  color: textColorTwo,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Fellix",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const LineWidget(
                          bottom: 20,
                          top: 20,
                        ),
                        const Text(
                          "Home country/region:",
                          style: TextStyle(
                            color: textColorTwo,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: "United State - ",
                            style: TextStyle(
                              color: textColorTwo,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Fellix",
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Change",
                                style: TextStyle(
                                  color: mainAppColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Fellix",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ButtonWidget(
                          onPressed: onButtonPressed,
                          text: "Sign Up",
                        ),
                      ],
                    ),
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
