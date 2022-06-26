// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/utils/database.dart';
import 'package:kostanku/modules/kost/views/list_kost_view.dart';

class AddKostView extends StatefulWidget {
  const AddKostView({Key? key}) : super(key: key);

  @override
  State<AddKostView> createState() => _AddKostViewState();
}

class _AddKostViewState extends State<AddKostView> {
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaPemilikController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

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
            'Tambah Kost',
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
    return CustomAppbar(
      context: context,
      backButton: true,
      // deleteButton: true,
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () async {
        await KostDatabase.create(
          namaKost: _namaKostController.text,
          namaPemilik: _namaPemilikController.text,
          nomorHP: _nomorHpController.text,
          alamat: _alamatController.text,
        );

        Fluttertoast.showToast(
          msg: "Data berhasil ditambahkan",
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => ListKostView(),
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
          hintText: 'Nama Pemilik',
          controller: _namaPemilikController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nomor HP',
          controller: _nomorHpController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Alamat',
          controller: _alamatController,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
