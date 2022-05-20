// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kostanku/constants/pallete.dart';

AppBar CustomAppbar({
  required BuildContext context,
  String? title,
  bool backButton = false,
  Widget? icon,
  bool deleteButton = false,
  void Function()? onTap,
  Color? backgroundColor,
}) {
  return AppBar(
    title: Text(title ?? ''),
    leading: IconButton(
      icon: backButton ? Icon(IconlyLight.arrow_left_2) : icon ?? Container(),
      color: Colors.black,
      onPressed: () {
        if (backButton) {
          Navigator.pop(context);
        } else {
          onTap;
        }
      },
    ),
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: () {
            if (deleteButton) {
              Navigator.pop(context);
            } else {
              onTap;
            }
          },
          icon: deleteButton ? Icon(IconlyBold.delete) : icon ?? Container(),
          color: Pallete.error)
    ],
    backgroundColor: backgroundColor ?? Pallete.background,
    elevation: 0,
  );
}
