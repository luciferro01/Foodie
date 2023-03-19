import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import '../controller/onborading_screen_controller.dart';
// import '../../constant/color.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = OnboardingScreenController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      // color: Color(#FEDEFF),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            // colors: [Color(0xffF9F9F9), Color(0xffffd6d6)],
            // colors: [Color(0xffF9F9F9), Color(0xfff9cdc3), Color(0xfffacefb)],
            colors: [
              Color(0xfff5cbd9),
              Color(0xfff4bccd),
              Color(0xffcacff9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        // color: mainColor,
      ),
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: _controller.selectedPage,
              controller: _controller.pageController,
              itemCount: _controller.onboardingModelList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      Image.asset(
                        _controller.onboardingModelList[index].image,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(flex: 2),
                      Text(
                        _controller.onboardingModelList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                      ),
                      const Spacer(flex: 1),
                      Text(
                        _controller.onboardingModelList[index].description,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: const Color.fromARGB(255, 179, 83, 247),
                            ),
                        textAlign: TextAlign.justify,
                      ),
                      const Spacer(flex: 4),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: _controller.skipAction,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Row(
                children: List.generate(
                  _controller.onboardingModelList.length,
                  (index) => Obx(() {
                    return _controller.selectedPage.value != index
                        ? AnimatedContainer(
                            duration: 300.milliseconds,
                            margin: const EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                          )
                        : AnimatedContainer(
                            duration: 400.milliseconds,
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 173, 103, 175),
                                shape: BoxShape.circle),
                          );
                  }),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.black,
                  highlightColor: Colors.black45,
                ),
                color: Colors.amber,
                iconSize: 40,
                onPressed: _controller.forwardAction,
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
