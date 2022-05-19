import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/views/add_DataKamar_view.dart';
import 'package:kostanku/modules/Kamar/views/list_dataKamar_view.dart';
import 'package:kostanku/modules/Kamar/components/DataKamar_card.dart';

class ListDataKamar extends StatefulWidget {
  const ListDataKamar({Key? key}) : super(key: key);

  @override
  State<ListDataKamar> createState() => _ListDataKamarState();
}

class _ListDataKamarState extends State<ListDataKamar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Data Kamar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(20, 0, 28, 20),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return DataKamarCard(
                kostName: 'Kost Melati',
                categoryName: 'VVIP',
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 28);
            },
            itemCount: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddDataKamar(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
