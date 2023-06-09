import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/constant/styles.dart';
import 'package:foodie/screens/navigation_screen.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class UserRegistration extends StatelessWidget {
  final String email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserRegistration({required this.email, super.key});
  // String emailController = '';
  String name = '';
  String address = '';
  String pinCode = '';
  String mobileNumber = '';

  void signUp() async {
    FormState formState = formKey.currentState!;
    try {
      if (formState.validate()) {
        formState.save();
        Map<String, dynamic> userRegistrationMap = {
          // 'email': emailController,
          'name': name,
          'address': address,
          'pincode': pinCode,
          'mobileNumber': mobileNumber,
        };
        FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .update(userRegistrationMap);
        Get.off(() => const NavigationScreen());
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: softWhite,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              // height: 400,
              child: Stack(
                children: [
                  Positioned(
                    left: -MediaQuery.of(context).size.height * 0.13,
                    top: -MediaQuery.of(context).size.height * 0.34,
                    child: const CircleAvatar(
                      backgroundColor: secondaryCircleColor,
                      radius: 250,
                    ),
                  ),
                  Positioned(
                    left: -MediaQuery.of(context).size.height * 0.1,
                    top: -MediaQuery.of(context).size.height * 0.1,
                    child: const CircleAvatar(
                      backgroundColor: primaryCircleColor,
                      radius: 100,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      'User Details',
                      style: highlightedTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            onSaved: (input) => name = input!,
                            style: fieldTextStyle,
                            decoration: InputDecoration(
                              // enabled: true,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor:
                                  const Color.fromARGB(95, 185, 243, 252),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: 'MOHIL BANSAL',
                              hintStyle: fadedTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        // Text('E-mail', style: labelTextStyle),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.8,
                        //   child: TextFormField(
                        //     validator: (input) {
                        //       if (input!.isEmpty ||
                        //           !input.contains("@") ||
                        //           !input.contains('.')) {
                        //         return 'Please enter the correct email address.';
                        //       }
                        //       return null;
                        //     },
                        //     keyboardType: TextInputType.emailAddress,
                        //     onSaved: (input) => emailController = input!,
                        //     style: fieldTextStyle,
                        //     decoration: InputDecoration(
                        //       prefixIcon: const Icon(
                        //         Icons.mail,
                        //         color: Colors.black,
                        //       ),
                        //       contentPadding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 6),
                        //       border: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             color: Color.fromARGB(253, 108, 207, 243)),
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       focusColor:
                        //           const Color.fromARGB(95, 185, 243, 252),
                        //       focusedBorder: const OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       hintText: 'mohil1111bansal@gmail.com',
                        //       hintStyle: fadedTextStyle,
                        //     ),
                        //     cursorColor: Colors.black,
                        //     cursorHeight: 20,
                        //   ),
                        // ),
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          'Phone Number',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty ||
                                  input.length < 10 ||
                                  input.length > 10) {
                                return 'Please enter correct phone number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            onSaved: (input) => name = input!,
                            style: fieldTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.phone_android_rounded,
                                color: Colors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(253, 108, 207, 243)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor:
                                  const Color.fromARGB(95, 185, 243, 252),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: '7737102961',
                              hintStyle: fadedTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          'Address',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            onSaved: (input) => address = input!,
                            style: fieldTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(253, 108, 207, 243)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor:
                                  const Color.fromARGB(95, 185, 243, 252),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: 'Near Old Bus Stand, Kumher',
                              hintStyle: fadedTextStyle,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.width * 0.06,
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Pin Code',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty || input.length > 6) {
                                return 'Please enter pin code of your area';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onSaved: (input) => pinCode = input!,
                            style: fieldTextStyle,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(253, 108, 207, 243)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor:
                                  const Color.fromARGB(95, 185, 243, 252),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: '321201',
                              hintStyle: fadedTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ElevatedButton(
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 35,
                              right: 35,
                            ),
                            minimumSize: const Size.fromHeight(50),
                            // backgroundColor: const Color(0xFFD3B177),
                            // foregroundColor: Colors.redAccent,
                            backgroundColor: primaryCircleColor,
                            foregroundColor: primaryCircleColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: labelTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
