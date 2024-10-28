import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/create_acc_pass_screen.dart';
import 'package:sync_score_application/screens/initial_screens/auth_screens/login_screen.dart';
import 'package:intl/intl.dart';
import '../../../core/text_form_field_widget.dart';
import 'auth_widgets.dart';

class CreateAccEmailScreen extends StatefulWidget {
  const CreateAccEmailScreen({super.key});

  @override
  State<CreateAccEmailScreen> createState() => _CreateAccEmailScreenState();
}

class _CreateAccEmailScreenState extends State<CreateAccEmailScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myNameController = TextEditingController();
  TextEditingController myAddressController = TextEditingController();
  TextEditingController myDobController = TextEditingController();

  @override
  void dispose() {
    myEmailController.dispose();
    myNameController.dispose();
    myAddressController.dispose();
    myDobController.dispose();
    super.dispose();
  }

  // void onButtonPressed() {
  //   if (myFormKey.currentState!.validate()) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => CreateAccPassScreen(
  //           email: myEmailController.text,
  //         ),
  //       ),
  //     );
  //   }
  // }


  // This method will be triggered when the "Continue" button is pressed.
  void onButtonPressed() {
    // Check if the form is valid
    if (myFormKey.currentState!.validate()) {
      // If valid, navigate to the next screen and pass the email
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => CreateAccPassScreen(
            name: myNameController.text,
            email: myEmailController.text, // Pass the entered email
            address: myAddressController.text,
            dob: myDobController.text,

          ),
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Earliest selectable date
      lastDate: DateTime.now(),  // Latest selectable date
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
      setState(() {
        myDobController.text = formattedDate;
      });
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
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Enter Your Your Details",
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
                          hintText: "Full Name",
                          labelText: "Name",
                          myController: myNameController,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "*required"),
                              // NameValidator(
                              //     errorText: "*incorrect name ")
                            ],
                          ).call,
                        ),
                        const SizedBox(height: 20),
                        TextFormFieldWidget(
                          hintText: '@gmail.com',
                          labelText: "Email",
                          myController: myEmailController,
                          textInputType: TextInputType.emailAddress,
                          prefixWidget:
                              SvgPicture.asset("assets/start_icons/mail.svg"),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "*required"),
                              // EmailValidator(
                              //     errorText: "*incorrect email ")
                            ],
                          ).call,
                        ),
                        const SizedBox(height: 20),
                        TextFormFieldWidget(
                          hintText: "123 Main St",
                          labelText: "Address",
                          myController: myAddressController,
                          validator: RequiredValidator(errorText: "*required").call,
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextFormFieldWidget(
                              hintText: "DD/MM/YYYY",
                              labelText: "Date of Birth",
                              myController: myDobController,
                              textInputType: TextInputType.datetime,
                              validator: RequiredValidator(errorText: "*required").call,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          onPressed: onButtonPressed,
                          text: "Continue",
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
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                  text: "Log In",
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
            ),
          ),
        ),
      ),
    );
  }
}
