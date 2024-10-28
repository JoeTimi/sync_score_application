import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sync_score_application/core/button_widget.dart';
import 'package:sync_score_application/core/clickable_widget.dart';
import 'package:sync_score_application/core/consts.dart';
import 'package:sync_score_application/core/text_form_field_widget.dart';
import 'package:sync_score_application/screens/main_screens/drawer_tabs/change_pass_screen.dart';

import 'drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var myFormKey = GlobalKey<FormState>();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myCPasswordController = TextEditingController();
  TextEditingController myDOBController = TextEditingController();

  @override
  void dispose() {
    myEmailController.dispose();
    myDOBController.dispose();
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
                            "Profile",
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
                          "Email",
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
                          hintText: '@gmail.com',
                          myController: myEmailController,
                          textInputType: TextInputType.emailAddress,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "*required"),
                              // EmailValidator(
                              //     errorText: "*incorrect email ")
                            ],
                          ).call,
                        ),
                        InkWellWidget(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ChangePassScreen(),
                              ),
                            );
                          },
                          child: IgnorePointer(
                            child: TextFormFieldWidget(
                              hintText: 'Change Password',
                              myController: myCPasswordController,
                              suffixIcon: SvgPicture.asset(
                                  "assets/main_icons/righ_side.svg"),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "*required"),
                                  // EmailValidator(
                                  //     errorText: "*incorrect email ")
                                ],
                              ).call,
                            ),
                          ),
                        ),
                        const Text(
                          "Date of Birth",
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
                          hintText: 'dd/mm/yyyy',
                          myController: myDOBController,
                          textInputType: TextInputType.datetime,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "*required"),
                              // EmailValidator(
                              //     errorText: "*incorrect email ")
                            ],
                          ).call,
                        ),
                        const Text(
                          "Country",
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
                        const CountryDropWidget(),
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
// import 'package:sync_score_application/base_client.dart'; // Import your base client
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   var myFormKey = GlobalKey<FormState>();
//   TextEditingController myEmailController = TextEditingController();
//   TextEditingController myCPasswordController = TextEditingController();
//   TextEditingController myDOBController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadProfileData(); // Load initial data
//   }
//
//   @override
//   void dispose() {
//     // Don't forget to dispose of the controllers to avoid memory leaks
//     myEmailController.dispose();
//     myCPasswordController.dispose();
//     myDOBController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadProfileData() async {
//     try {
//       final response = await BaseClient().get('/users/profile'); // Adjust your endpoint
//       if (response != null) {
//         myEmailController.text = response['email'] ?? '';
//         myDOBController.text = response['dob'] ?? '';
//       }
//     } catch (e) {
//       debugPrint('Error loading profile data: $e');
//     }
//   }
//
//   Future<void> _saveProfileData() async {
//     if (myFormKey.currentState!.validate()) {
//       try {
//         final response = await BaseClient().put(
//           '/users/profile', // Adjust your endpoint
//           {
//             'email': myEmailController.text,
//             'dob': myDOBController.text,
//           }, data: {},
//         );
//         if (response != null) {
//           // Handle success (optional)
//         }
//       } catch (e) {
//         debugPrint('Error saving profile data: $e');
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: mainAppColor,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: const Color(0xFFFAFAFA),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               InkWellWidget(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: 50,
//                   color: mainAppColor,
//                   margin: const EdgeInsets.only(bottom: 14),
//                   padding: const EdgeInsets.symmetric(horizontal: dp),
//                   child: Center(
//                     child: Row(
//                       children: <Widget>[
//                         InkWellWidget(
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: SvgPicture.asset(
//                               height: 10,
//                               width: 6,
//                               "assets/main_icons/left_side.svg",
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         const Expanded(
//                           child: Text(
//                             "Profile",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: whiteColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(dp),
//                     child: Form(
//                       key: myFormKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           const Text(
//                             "Email",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xFF81809E),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           TextFormFieldWidget(
//                             hintText: '@gmail.com',
//                             myController: myEmailController,
//                             textInputType: TextInputType.emailAddress,
//                             validator: MultiValidator(
//                               [
//                                 RequiredValidator(errorText: "*required"),
//                               ],
//                             ).call,
//                           ),
//                           const Text(
//                             "Date of Birth",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xFF81809E),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           TextFormFieldWidget(
//                             hintText: 'dd/mm/yyyy',
//                             myController: myDOBController,
//                             textInputType: TextInputType.datetime,
//                             validator: MultiValidator(
//                               [
//                                 RequiredValidator(errorText: "*required"),
//                               ],
//                             ).call,
//                           ),
//                           const SizedBox(height: 20),
//                           InkWellWidget(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                   const ChangePassScreen(),
//                                 ),
//                               );
//                             },
//                             child: IgnorePointer(
//                               child: TextFormFieldWidget(
//                                 hintText: 'Change Password',
//                                 suffixIcon: SvgPicture.asset(
//                                   "assets/main_icons/righ_side.svg",
//                                 ),
//                                 textInputType: TextInputType.text,
//                                 validator: (value){
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 60),
//                           ButtonWidget(
//                             onPressed: _saveProfileData,
//                             text: "Save Changes",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
