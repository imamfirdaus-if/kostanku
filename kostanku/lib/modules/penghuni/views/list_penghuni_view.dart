import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/components/kost_card.dart';
import 'package:kostanku/modules/kategori/components/kategori_card.dart';
import 'package:kostanku/modules/penghuni/components/penghuni_card.dart';

import 'add_DataPenghuni_view.dart';

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
      children: [
        Text(
          'Daftar Penghuni',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              //childAspectRatio: 4 / 4
            ),
            itemBuilder: (BuildContext, int) {
              return PenghuniCard(
                  ownerName: 'Ifany Tustianti',
                  kostName: 'Kost Melati',
                  categoryName: 'VVIP',
                  phoneNumber: 6285637283939);
            },
            itemCount: 20,
          ),
        )
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddDataPenghuni(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
