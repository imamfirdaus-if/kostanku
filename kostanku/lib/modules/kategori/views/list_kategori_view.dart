import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/components/kost_card.dart';
import 'package:kostanku/modules/kost/views/add_kost_view.dart';
import 'package:kostanku/modules/kategori/components/kategori_card.dart';
import 'package:kostanku/modules/kategori/views/list_kategori_view.dart';
import 'add_kategori_view.dart';

class ListKategoriView extends StatefulWidget {
  const ListKategoriView({Key? key}) : super(key: key);

  @override
  State<ListKategoriView> createState() => _ListKategoriViewState();
}

class _ListKategoriViewState extends State<ListKategoriView> {
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
          'Daftar Kategori',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return categoryCard(
                categoryName: 'VVIP',
                facility: 'listrik, air, kamar mandi di dalam, wi-fi, ac',
                price: 'Rp.1.500.000/Bulan',
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
        MaterialPageRoute(
          builder: (context) => AddKategoriView(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
