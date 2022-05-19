import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

class DataKamarCard extends StatelessWidget {
  String kostName;
  String categoryName;

  DataKamarCard({
    Key? key,
    required this.kostName,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Pallete.secondary,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage('images/pict1.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kostName,
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 3),
              Text(
                categoryName,
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
