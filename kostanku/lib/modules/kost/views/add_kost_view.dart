// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_dialog.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/utils/database_kost.dart';
import 'package:kostanku/modules/kost/views/list_kost_view.dart';

class AddKostView extends StatefulWidget {
  String? documentId;
  String? namaKost;
  String? namaPemilik;
  String? nomorHP;
  String? alamat;
  bool isEdit;
  AddKostView({
    Key? key,
    this.isEdit = false,
    this.documentId,
    this.namaKost,
    this.namaPemilik,
    this.nomorHP,
    this.alamat,
  }) : super(key: key);

  @override
  State<AddKostView> createState() => _AddKostViewState();
}

class _AddKostViewState extends State<AddKostView> {
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaPemilikController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final User? _user = FirebaseAuth.instance.currentUser;
  late String title;

  @override
  void initState() {
    title = "Tambah Kost";
    log("isEdit: ${widget.isEdit}");

    if (widget.isEdit) {
      log(widget.documentId!);
      _namaKostController.text = widget.namaKost!;
      _namaPemilikController.text = widget.namaPemilik!;
      _nomorHpController.text = widget.nomorHP!;
      _alamatController.text = widget.alamat!;
      title = "Edit Kost";
    }
    super.initState();
  }

  @override
  void dispose() {
    _namaKostController.dispose();
    _namaPemilikController.dispose();
    _nomorHpController.dispose();
    _alamatController.dispose();
    super.dispose();
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
            title,
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
      deleteButton: widget.isEdit,
      onDelete: () {
        showConfirmationDialog(
          context: context,
          title: "Hapus data?",
          onYes: () async {
            await KostDatabase.delete(
              documentId: widget.documentId,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil dihapus",
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
          onNo: () => Navigator.pop(context),
          yesColor: Pallete.error,
        );
      },
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () async {
        if (widget.isEdit) {
          if (_namaKostController.text == "" ||
              _namaPemilikController.text == "" ||
              _nomorHpController.text == "" ||
              _alamatController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            await KostDatabase.update(
              documentId: widget.documentId!,
              userId: _user!.uid,
              namaKost: _namaKostController.text,
              namaPemilik: _namaPemilikController.text,
              nomorHP: _nomorHpController.text,
              alamat: _alamatController.text,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil diubah",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => ListKostView(),
              ),
            );
          }
        } else {
          if (_namaKostController.text == "" ||
              _namaPemilikController.text == "" ||
              _nomorHpController.text == "" ||
              _alamatController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
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
          }
        }
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
          numberOnly: true,
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
