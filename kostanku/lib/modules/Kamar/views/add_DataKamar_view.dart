import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';

class AddDataKamar extends StatefulWidget {
  const AddDataKamar({Key? key}) : super(key: key);

  @override
  State<AddDataKamar> createState() => _AddDataKamarState();
}

class _AddDataKamarState extends State<AddDataKamar> {
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
      deleteButton: true,
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Tambah Data',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 70),
        _buildFormField(),
      ],
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
      ),
      SizedBox(height: 20),
      CustomTextField(
        hintText: 'Nama Kategori',
      ),
      SizedBox(height: 20),
      _buildFormUpload()
    ],
  );
}

Widget _buildFormUpload() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    width: 336,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Text(
          'Foto Kamar',
          style: TextStyle(color: Pallete.disabled),
        ),
        SizedBox(width: 120),
        _buildUploadButton()
      ],
    ),
  );
}

Widget _buildUploadButton() {
  return ElevatedButton(
    onPressed: () {},
    child: Text(
      'Upload',
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Pallete.primary),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
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
