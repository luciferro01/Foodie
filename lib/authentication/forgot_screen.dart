import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String emailController = ' ';

  Future resetPassword() async {
    try {
      FormState formState = _formKey.currentState!;
      if (formState.validate()) {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Password Reset Link',
            animationDuration: Duration(seconds: 1),
            borderRadius: 10,
            icon: Icon(
              Icons.security_update_good_outlined,
              color: Colors.black,
            ),
            messageText:
                Text('Password Reset Link has been sent to your mail id'),
            isDismissible: true,
            duration: Duration(seconds: 3),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            backgroundColor: Colors.lightBlueAccent,
            // message: 'TExt',
          ),
        );
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController);
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryCircleColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Hero(
                      tag: 'hero-logIn',
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/foodie_logo.png")),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Form(
                  // autovalidateMode: AutovalidateMode.,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty ||
                              !input.contains("@") ||
                              !input.contains('.')) {
                            return 'Please enter the correct email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        // controller: emailController,
                        onSaved: (input) => emailController = input!,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(253, 108, 207, 243)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusColor: const Color.fromARGB(95, 185, 243, 252),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: resetPassword,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 35,
                            right: 35,
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: mainColor,
                          // foregroundColor: Colors.redAccent,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Hero(
                          tag: 'Log In Button',
                          child: Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.black, fontSize: 20),
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
    );
  }
}
