// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridItem extends StatefulWidget {
  String title;
  Function()? onTap;
  GridItem({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Pallete.error,
      borderRadius: BorderRadius.circular(8),
      onTap: widget.onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Klik untuk lihat detail',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 4),
            SvgPicture.asset(
              'assets/svgs/home_grid_arrow.svg',
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
