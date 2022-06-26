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
import 'package:kostanku/modules/penghuni/utils/database_penghuni.dart';
import 'package:kostanku/modules/penghuni/views/list_penghuni_view.dart';

class AddPenghuniView extends StatefulWidget {
  String? idPenghuni;
  String? namaKost;
  String? namaKategori;
  String? namaKamar;
  String? namaPenghuni;
  String? kontak;
  String? kontakDarurat;
  String? alamatAsal;
  String? pekerjaan;
  bool isEdit;
  AddPenghuniView({
    Key? key,
    this.isEdit = false,
    this.idPenghuni,
    this.namaKost,
    this.namaKategori,
    this.namaKamar,
    this.namaPenghuni,
    this.kontak,
    this.kontakDarurat,
    this.alamatAsal,
    this.pekerjaan,
  }) : super(key: key);

  @override
  State<AddPenghuniView> createState() => _AddPenghuniViewState();
}

class _AddPenghuniViewState extends State<AddPenghuniView> {
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaKategoriController = TextEditingController();
  final TextEditingController _namaKamarController = TextEditingController();
  final TextEditingController _namaPenghuniController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();
  final TextEditingController _kontakDaruratController =
      TextEditingController();
  final TextEditingController _alamatAsalController = TextEditingController();
  final TextEditingController _pekerjaanController = TextEditingController();
  final User? _user = FirebaseAuth.instance.currentUser;
  late String title;

  @override
  void initState() {
    title = "Tambah Penghuni";
    log("isEdit: ${widget.isEdit}");

    if (widget.isEdit) {
      log(widget.idPenghuni!);
      _namaKostController.text = widget.namaKost!;
      _namaKategoriController.text = widget.namaKategori!;
      _namaKamarController.text = widget.namaKamar!;
      _namaPenghuniController.text = widget.namaPenghuni!;
      _kontakController.text = widget.kontak!;
      _kontakDaruratController.text = widget.kontakDarurat!;
      _alamatAsalController.text = widget.alamatAsal!;
      _pekerjaanController.text = widget.pekerjaan!;
      title = "Edit Penghuni";
    }
    super.initState();
  }

  @override
  void dispose() {
    _namaKostController.dispose();
    _namaKategoriController.dispose();
    _namaKamarController.dispose();
    _namaPenghuniController.dispose();
    _kontakController.dispose();
    _kontakDaruratController.dispose();
    _alamatAsalController.dispose();
    _pekerjaanController.dispose();
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
            await PenghuniDatabase.delete(
              idPenghuni: widget.idPenghuni,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil dihapus",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => ListPenghuniView(),
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
              _namaKategoriController.text == "" ||
              _namaKamarController.text == "" ||
              _namaPenghuniController.text == "" ||
              _kontakController.text == "" ||
              _kontakDaruratController.text == "" ||
              _alamatAsalController.text == "" ||
              _pekerjaanController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            await PenghuniDatabase.update(
              idPenghuni: widget.idPenghuni!,
              userId: _user!.uid,
              namaKost: _namaKostController.text,
              namaKategori: _namaKategoriController.text,
              namaKamar: _namaKamarController.text,
              namaPenghuni: _namaPenghuniController.text,
              kontak: _kontakController.text,
              kontakDarurat: _kontakDaruratController.text,
              alamatAsal: _alamatAsalController.text,
              pekerjaan: _pekerjaanController.text,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil diubah",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => ListPenghuniView(),
              ),
            );
          }
        } else {
          if (_namaKostController.text == "" ||
              _namaKategoriController.text == "" ||
              _namaKamarController.text == "" ||
              _namaPenghuniController.text == "" ||
              _kontakController.text == "" ||
              _kontakDaruratController.text == "" ||
              _alamatAsalController.text == "" ||
              _pekerjaanController.text == "") {
            Fluttertoast.showToast(
              msg: "Data tidak boleh kosong",
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            await PenghuniDatabase.create(
              namaKost: _namaKostController.text,
              namaKategori: _namaKategoriController.text,
              namaKamar: _namaKamarController.text,
              namaPenghuni: _namaPenghuniController.text,
              kontak: _kontakController.text,
              kontakDarurat: _kontakDaruratController.text,
              alamatAsal: _alamatAsalController.text,
              pekerjaan: _pekerjaanController.text,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil ditambahkan",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => ListPenghuniView(),
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
          hintText: 'Nama Kategori',
          controller: _namaKategoriController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nama Kamar',
          controller: _namaKamarController,
          numberOnly: true,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Nama Penghuni',
          controller: _namaPenghuniController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Kontak',
          controller: _kontakController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Kontak Darurat',
          controller: _kontakDaruratController,
          numberOnly: true,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Alamat Asal',
          controller: _alamatAsalController,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Pekerjaan',
          controller: _pekerjaanController,
          numberOnly: true,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
