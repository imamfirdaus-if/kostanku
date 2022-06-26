// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/utils/database_kamar.dart';
import 'package:kostanku/modules/Kamar/views/list_dataKamar_view.dart';

class AddKamarView extends StatefulWidget {
  const AddKamarView({Key? key}) : super(key: key);

  @override
  State<AddKamarView> createState() => _AddKamarViewState();
}

class _AddKamarViewState extends State<AddKamarView> {
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaKategoriController = TextEditingController();
  final TextEditingController _namaKamarController = TextEditingController();

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
            'Tambah Kamar',
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
        await KamarDatabase.create(
          namaKost: _namaKostController.text,
          namaKategori: _namaKategoriController.text,
          namaKamar: _namaKamarController.text,
        );

        Fluttertoast.showToast(
          msg: "Data berhasil ditambahkan",
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => ListKamarView(),
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
          hintText: 'Nama Kost',
          controller: _namaKostController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Kategori',
          controller: _namaKategoriController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nama Kamar',
          controller: _namaKamarController,
        ),
      ],
    );
  }
}
