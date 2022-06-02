// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/views/add_DataKamar_view.dart';
import 'package:kostanku/modules/kost/views/add_kost_view.dart';
import 'package:kostanku/modules/penghuni/components/penghuni_grid_item.dart';
import 'package:kostanku/modules/penghuni/views/add_DataPenghuni_view.dart';

class ListPenghuniView extends StatefulWidget {
  const ListPenghuniView({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPenghuniView> createState() => _ListPenghuniViewState();
}

class _ListPenghuniViewState extends State<ListPenghuniView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Daftar Penghuni',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
            physics: BouncingScrollPhysics(),
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1 / 1.3,
            children: List.generate(
              20,
              (index) => PenghuniGridItem(
                name: 'Farhan Rizky',
                kostName: 'Kost Melati',
                kostCategory: 'VVIP',
                phoneNumber: "8888888888888",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => AddDataPenghuni(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
