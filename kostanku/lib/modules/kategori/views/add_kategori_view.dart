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
import 'package:kostanku/modules/kategori/utils/database_kategori.dart';
import 'package:kostanku/modules/kategori/views/list_kategori_view.dart';

class AddKategoriView extends StatefulWidget {
  String? idKategori;
  String? namaKategori;
  String? fasilitas;
  String? harga;
  bool isEdit;
  AddKategoriView({
    Key? key,
    this.isEdit = false,
    this.idKategori,
    this.namaKategori,
    this.fasilitas,
    this.harga,
  }) : super(key: key);

  @override
  State<AddKategoriView> createState() => _AddKategoriViewState();
}

class _AddKategoriViewState extends State<AddKategoriView> {
  final TextEditingController _namaKategoriController = TextEditingController();
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final User? _user = FirebaseAuth.instance.currentUser;
  late String title;

  @override
  void initState() {
    title = "Tambah Kategori";
    log("isEdit: ${widget.isEdit}");

    if (widget.isEdit) {
      log(widget.idKategori!);
      _namaKategoriController.text = widget.namaKategori!;
      _fasilitasController.text = widget.fasilitas!;
      _hargaController.text = widget.harga!;
      title = "Edit Kategori";
    }
    super.initState();
  }

  @override
  void dispose() {
    _namaKategoriController.dispose();
    _fasilitasController.dispose();
    _hargaController.dispose();
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
            await KategoriDatabase.delete(
              idKategori: widget.idKategori,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil dihapus",
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
          if (_namaKategoriController.text == "" ||
              _fasilitasController.text == "" ||
              _hargaController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            await KategoriDatabase.update(
              idKategori: widget.idKategori!,
              userId: _user!.uid,
              namaKategori: _namaKategoriController.text,
              fasilitas: _fasilitasController.text,
              harga: _hargaController.text,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil diubah",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => ListKategoriView(),
              ),
            );
          }
        } else {
          if (_namaKategoriController.text == "" ||
              _fasilitasController.text == "" ||
              _hargaController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
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
          hintText: 'Harga',
          controller: _hargaController,
          numberOnly: true,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
