// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaPemilikController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference kost = FirebaseFirestore.instance.collection("kost");

  Future<void> addKost() {
    return kost.add({
      "nama_kost": _namaKostController.text,
      "nama_pemilik": _namaPemilikController.text,
      "nomor_hp": _nomorHpController.text,
      "alamat": _alamatController.text,
    }).then((value) {
      log("Kost added");
    }).catchError((error) {
      log(error);
    });
  }

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
    return CustomAppbar(context: context, backButton: true, deleteButton: true);
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        addKost();
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
        Center(
          child: _buildPinLocationButton(),
        ),
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
