// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kategori/utils/database_kategori.dart';
import 'package:kostanku/modules/kategori/views/list_kategori_view.dart';

class AddKategoriView extends StatefulWidget {
  const AddKategoriView({Key? key}) : super(key: key);

  @override
  State<AddKategoriView> createState() => _AddKategoriViewState();
}

class _AddKategoriViewState extends State<AddKategoriView> {
  final TextEditingController _namaKategoriController = TextEditingController();
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tambah Kategori',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 100),
          _buildFormField(),
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(context: context, backButton: true, deleteButton: true);
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () async {
        await KategoriDatabase.create(
          namaKategori: _namaKategoriController.text,
          fasilitas: _fasilitasController.text,
          harga: _hargaController.text,
        );

        Fluttertoast.showToast(
          msg: "Data berhasil ditambahkan",
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => ListKategoriView(),
          ),
        );
      },
      backgroundColor: Pallete.secondary,
      child: Icon(
        Icons.check_circle_rounded,
        size: 35,
      ),
    );
  }

  Widget _buildFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Masukkan data dengan benar'),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nama Kategori',
          controller: _namaKategoriController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Fasilitas',
          controller: _fasilitasController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Harga Sewa',
          controller: _hargaController,
        ),
      ],
    );
  }
}
