// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';

// class SnackBarWIdget extends StatelessWidget {
//   final String title;
//   final String message;
//   final IconData icon;

//   const SnackBarWIdget(
//       {super.key,
//       required this.title,
//       required this.message,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return
// }

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SnackBarWidget {
  // late String title;
  // late IconData icon;
  // late String message;
  Widget snackBarFunction(String title, IconData icon, String message) {
    return GetSnackBar(
      title: title,
      animationDuration: const Duration(seconds: 1),
      borderRadius: 10,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      messageText: Text(message),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      backgroundColor: Colors.lightBlueAccent,
      // message: 'TExt',
    );
  }
}
