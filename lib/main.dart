import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:foodie/screens/home_screen.dart';
import 'package:foodie/screens/navigation_screen.dart';
// import 'package:foodie/screens/account_screen.dart';
// import 'package:foodie/screens/home_screen.dart';
// import 'package:foodie/registration_screen/identification.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import './onboarding_screen/screen/onborading_screen.dart';
import './splash_screen/splash_screen.dart';
// import 'constant/color.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'registration_screen/user_registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: currentUser?.uid == null
          ? const SplashScreen()
          : const NavigationScreen(),
    );
  }
}
