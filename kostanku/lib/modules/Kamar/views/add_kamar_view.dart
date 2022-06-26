// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/components/custom_dialog.dart';
import 'package:kostanku/components/custom_textfield.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/utils/database_kamar.dart';
import 'package:kostanku/modules/kamar/views/list_kamar_view.dart';

class AddKamarView extends StatefulWidget {
  String? documentId;
  bool isEdit;
  String? namaKost;
  String? namaKategori;
  String? namaKamar;
  AddKamarView({
    Key? key,
    this.isEdit = false,
    this.documentId,
    this.namaKost,
    this.namaKategori,
    this.namaKamar,
  }) : super(key: key);

  @override
  State<AddKamarView> createState() => _AddKamarViewState();
}

class _AddKamarViewState extends State<AddKamarView> {
  final TextEditingController _namaKostController = TextEditingController();
  final TextEditingController _namaKategoriController = TextEditingController();
  final TextEditingController _namaKamarController = TextEditingController();
  late String title;

  final User? _user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    title = "Tambah Kamar";

    if (widget.isEdit) {
      title = "Edit Kamar";
      _namaKostController.text = widget.namaKost!;
      _namaKategoriController.text = widget.namaKategori!;
      _namaKamarController.text = widget.namaKamar!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _namaKostController.dispose();
    _namaKategoriController.dispose();
    _namaKamarController.dispose();
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
            await KamarDatabase.delete(
              documentId: widget.documentId,
            );

            Fluttertoast.showToast(
              msg: "Data berhasil dihapus",
              toastLength: Toast.LENGTH_SHORT,
            );

            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => ListKamarView(),
              ),
              (route) => true,
            );
          },
          onNo: () => Navigator.pop(context),
          yesColor: Pallete.error,
        );
      },
    );
  }

  Widget _buildFAB() {
    late String msg;

    return FloatingActionButton(
      onPressed: () async {
        if (widget.isEdit) {
          msg = "Data berhasil diubah";
          await KamarDatabase.update(
            documentId: widget.documentId!,
            userId: _user!.uid,
            namaKost: _namaKostController.text,
            namaKategori: _namaKategoriController.text,
            namaKamar: _namaKamarController.text,
          );
        } else {
          msg = "Data berhasil ditambahkan";
          await KamarDatabase.create(
            namaKost: _namaKostController.text,
            namaKategori: _namaKategoriController.text,
            namaKamar: _namaKamarController.text,
          );
        }

        Fluttertoast.showToast(
          msg: msg,
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
