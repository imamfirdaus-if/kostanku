import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';

class ListPenghuniView extends StatefulWidget {
  const ListPenghuniView({Key? key}) : super(key: key);

  @override
  State<ListPenghuniView> createState() => _ListPenghuniViewState();
}

class _ListPenghuniViewState extends State<ListPenghuniView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: _buildAppbar(),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
    );
  }
}
