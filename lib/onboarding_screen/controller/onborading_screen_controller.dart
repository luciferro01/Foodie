import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../authentication/authentication_home_screen.dart';
import '/onboarding_screen/models/onboarding_screen_model.dart';

class OnboardingScreenController extends GetxController {
  var selectedPage = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPage.value == onboardingModelList.length - 1;

  void forwardAction() {
    if (isLastPage) {
      // pageController.animateToPage(0,
      //     duration: 400.milliseconds, curve: Curves.decelerate);\
      Get.off(
        () => const AuthScreen(),
      );
    } else if (selectedPage.value == pageController.initialPage ||
        selectedPage.value == 0) {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.easeInBack);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  void skipAction() {
    pageController.animateToPage(onboardingModelList.length - 1,
        curve: Curves.decelerate, duration: 300.milliseconds);
  }

  List<OnboradingScreenModel> onboardingModelList = const [
    OnboradingScreenModel(
        image: 'assets/onboarding_screen/welcome.png',
        title: 'Welome to the Foodie',
        description: 'A project by Team Mighty Eagle'),
    OnboradingScreenModel(
        image: 'assets/onboarding_screen/tools.png',
        title: 'An App for all',
        description:
            'Contains all the basic tools required by you to add productivity in your life & make your life easier.'),
    OnboradingScreenModel(
        image: 'assets/onboarding_screen/relaxed.png',
        title: 'Intutive',
        description:
            'A user friendly, easy to use, bug-free(😉) app to give wings to your ideas.'),
    OnboradingScreenModel(
        image: 'assets/onboarding_screen/globe_cut.png',
        title: ' Enter into the world',
        description:
            'Are you ready to enter into the world of productivity? So, yes enter to the world.')
  ];
}
