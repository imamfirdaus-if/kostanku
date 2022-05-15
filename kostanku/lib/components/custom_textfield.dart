// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

class CustomTextField extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          hintText: widget.hintText ?? '',
          hintStyle: TextStyle(fontSize: 14, color: Pallete.disabled),
        ),
      ),
    );
  }
}
