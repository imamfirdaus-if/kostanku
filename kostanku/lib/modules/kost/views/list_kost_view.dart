// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/components/kost_card.dart';
import 'package:kostanku/modules/kost/views/add_kost_view.dart';

class ListKostView extends StatefulWidget {
  const ListKostView({Key? key}) : super(key: key);

  @override
  State<ListKostView> createState() => _ListKostViewState();
}

class _ListKostViewState extends State<ListKostView> {
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
          'Daftar Kost',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return KostCard(
                kostName: 'Kost Melati',
                ownerName: 'Farhan',
                phoneNumber: '88888888',
                address: 'Banjaran',
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 28);
            },
            itemCount: 10,
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
          builder: (context) => AddKostView(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
