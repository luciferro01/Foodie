import 'package:flutter/material.dart';

class AccountItems {
  final IconData icon;
  final String title;
  final Function onpressed;
  AccountItems(
      {required this.icon, required this.onpressed, required this.title});
}
