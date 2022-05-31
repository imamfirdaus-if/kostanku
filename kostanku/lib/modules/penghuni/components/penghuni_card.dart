import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/constants/pallete.dart';

class PenghuniCard extends StatelessWidget {
  String ownerName;
  String kostName;
  String categoryName;
  num phoneNumber;

  PenghuniCard(
      {Key? key,
      required this.ownerName,
      required this.kostName,
      required this.categoryName,
      required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Center(
                child:
                    CircleAvatar(radius: 30, backgroundColor: Pallete.primary)),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              ownerName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kostName,
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    '$phoneNumber',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
