// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

class PenghuniGridItem extends StatefulWidget {
  String name;
  String kostName;
  String kostCategory;
  String phoneNumber;
  PenghuniGridItem({
    Key? key,
    required this.name,
    required this.kostName,
    required this.kostCategory,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<PenghuniGridItem> createState() => _PenghuniGridItemState();
}

class _PenghuniGridItemState extends State<PenghuniGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Pallete.secondary,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.kostName,
            style: TextStyle(
              color: Pallete.disabled,
              fontSize: 12,
            ),
          ),
          Text(
            widget.kostCategory,
            style: TextStyle(
              color: Pallete.disabled,
              fontSize: 12,
            ),
          ),
          Text(
            widget.phoneNumber,
            style: TextStyle(
              color: Pallete.disabled,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
