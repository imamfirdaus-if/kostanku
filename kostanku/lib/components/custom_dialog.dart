// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

showConfirmationDialog({
  required BuildContext context,
  String? title,
  Function()? onYes,
  Function()? onNo,
  Color? yesColor,
  Color? noColor,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onNo,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    noColor ?? Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: Text(
                  'Tidak',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: onYes,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    yesColor ?? Pallete.primary,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                child: Text('Ya'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
