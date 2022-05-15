// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';

class AddKostView extends StatefulWidget {
  const AddKostView({Key? key}) : super(key: key);

  @override
  State<AddKostView> createState() => _AddKostViewState();
}

class _AddKostViewState extends State<AddKostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 70),
          _buildFormField(),
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
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
          hintText: 'Nama Pemilik',
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nomor HP',
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Alamat',
        ),
        SizedBox(height: 20),
        Center(child: _buildPinLocationButton()),
      ],
    );
  }

  Widget _buildPinLocationButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Pallete.primary),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text('Pasang Lokasi'),
    );
  }
}
