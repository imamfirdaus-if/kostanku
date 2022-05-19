// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';

class AddDataKamar extends StatefulWidget {
  const AddDataKamar({Key? key}) : super(key: key);

  @override
  State<AddDataKamar> createState() => _AddDataKamarState();
}

class _AddDataKamarState extends State<AddDataKamar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
    );
  }
}

Widget _buildBody() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 42, 0, 55),
    child: Text('Coming soon hehe', style: TextStyle(color: Pallete.error)),
  );
}
