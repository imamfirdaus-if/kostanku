// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kostanku/constants/pallete.dart';

class ReportItem extends StatefulWidget {
  String iconUrl;
  String title;
  String number;
  ReportItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.number,
  }) : super(key: key);

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPrimaryContainer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildSecondaryContainer(),
        )
      ],
    );
  }

  Widget _buildSecondaryContainer() {
    return Container(
      height: 10,
      width: 250,
      decoration: BoxDecoration(
        color: Pallete.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildPrimaryContainer() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Pallete.primary,
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  widget.iconUrl,
                  width: 30,
                ),
                SizedBox(width: 14),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              widget.number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
