import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import '../constant/color.dart';
import 'authentication_home_screen.dart';
import 'controller/authenticatin_controller.dart';
import 'logged_in_user_screen.dart';
// import '../../constants/.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String passwordController = '';
  String emailController = '';
  String confirmPasswordController = ' ';
  bool visibility = false;
  Icon icon = const Icon(
    Icons.remove_red_eye,
    color: Colors.black,
  );
  bool obscure = true;
  late UserCredential user;
  void signUp() async {
    FormState formState = _formKey.currentState!;
    try {
      if (formState.validate()) {
        formState.save();
        // ignore: unused_local_variable
        if (passwordController == confirmPasswordController) {
          user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.trim(),
            password: passwordController.trim(),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      //ignore:, avoid_print
      print(e.code);
      switch (e.code) {
        case "user-not-found":
          Get.showSnackbar(
            const GetSnackBar(
              title: 'User Not Found',
              animationDuration: Duration(seconds: 1),
              borderRadius: 10,
              icon: Icon(
                Icons.security_update_good_outlined,
                color: Colors.black,
              ),
              messageText: Text('Please Sign Up first to logIn into the App'),
              isDismissible: true,
              duration: Duration(seconds: 3),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              backgroundColor: Colors.lightBlueAccent,
            ),
          );

          break;
        case "email-already-in-use":
          Get.showSnackbar(
            const GetSnackBar(
              title: 'Invalid Email',
              animationDuration: Duration(seconds: 1),
              borderRadius: 10,
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              messageText: Text(
                  'The Email you have entered is already in use please sign up with another mail'),
              isDismissible: true,
              duration: Duration(seconds: 3),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
          break;
        case "invalid-password":
          Get.showSnackbar(
            const GetSnackBar(
              title: 'Invalid Password',
              animationDuration: Duration(seconds: 1),
              borderRadius: 10,
              icon: Icon(
                Icons.password,
                color: Colors.black,
              ),
              messageText: Text(
                  "Please enter the correct password if forgot you can use Forgot Password"),
              isDismissible: true,
              duration: Duration(seconds: 3),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
          break;
      }
    }
    // User? currentUser = FirebaseAuth.instance.currentUser;
    // print(currentUser!.email);
    // if (user.user != null) {
    //   Get.to(() => HomeScreen());
    // }
    Get.to(() => LoggInUserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
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
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/test_app.png")),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    //Email Verification

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
                      onSaved: (input) => emailController = input!,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input!.length < 6 || input.isEmpty) {
                          return 'Please enter the password of minimum 6 digits';
                        }
                        return null;
                      },
                      onSaved: (input) => passwordController = input!,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
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
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          onTap: () {
                            // visibility = true;
                            if (visibility == true) {
                              visibility = false;
                              setState(() {
                                icon = const Icon(Icons.remove_red_eye_outlined,
                                    color: Colors.black);
                              });
                              obscure = false;
                            } else if (visibility == false) {
                              visibility = true;
                              setState(() {
                                icon = const Icon(Icons.remove_red_eye,
                                    color: Colors.black);
                                obscure = true;
                              });
                            }
                          },
                          child: icon,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscure,
                      // obscuringCharacter: '#',
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // Confirm Password
                    TextFormField(
                      validator: (input) {
                        if (input!.length < 6 || input.isEmpty) {
                          return 'Please enter the password of minimum 6 digits';
                        }
                        if (passwordController != confirmPasswordController) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSaved: (input) => confirmPasswordController = input!,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
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
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffix: GestureDetector(
                          onTap: () {
                            // visibility = true;
                            if (visibility == true) {
                              visibility = false;
                              setState(() {
                                icon = const Icon(Icons.remove_red_eye_outlined,
                                    color: Colors.black);
                              });
                              obscure = false;
                            } else if (visibility == false) {
                              visibility = true;
                              setState(() {
                                icon = const Icon(Icons.remove_red_eye,
                                    color: Colors.black);
                                obscure = true;
                              });
                            }
                          },
                          child: icon,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscure,
                      // obscuringCharacter: '#',
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //Sign Up Button

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
                        backgroundColor: const Color(0xFFD3B177),
                        foregroundColor: Colors.redAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Hero(
                        tag: 'Log In Button',
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(const AuthScreen()),
                    child: const Text(
                      'Log In ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.blueGrey,
                      thickness: 2,
                      indent: 40,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    // decoration,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: const Text(
                      'Or',
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.blueGrey,
                      thickness: 2,
                      endIndent: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    minimumSize: const Size.fromHeight(40)),
                onPressed: AuthController().googleSignIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: Image.asset(
                        "assets/icons/google.png",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    minimumSize: const Size.fromHeight(40)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Image.asset("assets/icons/facebook.png")),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Text(
                      'Continue with Facebook',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
