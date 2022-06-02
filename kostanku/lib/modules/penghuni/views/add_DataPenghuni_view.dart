import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';

class AddDataPenghuni extends StatefulWidget {
  const AddDataPenghuni({Key? key}) : super(key: key);

  @override
  State<AddDataPenghuni> createState() => _AddDataPenghuniState();
}

class _AddDataPenghuniState extends State<AddDataPenghuni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: _buildAppbar(),
      floatingActionButton: _buildFAB(),
      // body: Center(child: Text('coming soon')),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
      deleteButton: true,
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Pallete.secondary,
      child: Icon(
        Icons.check_circle_rounded,
        size: 35,
      ),
    );
  }
}
