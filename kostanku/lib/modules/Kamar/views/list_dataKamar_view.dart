// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/components/DataKamar_card.dart';
import 'package:kostanku/modules/Kamar/utils/database_kamar.dart';
import 'package:kostanku/modules/Kamar/views/add_dataKamar_view.dart';

class ListKamarView extends StatefulWidget {
  const ListKamarView({Key? key}) : super(key: key);

  @override
  State<ListKamarView> createState() => _ListKamarViewState();
}

class _ListKamarViewState extends State<ListKamarView> {
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
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Daftar Kamar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Flexible(
          child: StreamBuilder<QuerySnapshot>(
              stream: KamarDatabase.read(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data() as dynamic;
                      // String documentId = snapshot.data!.docs[index].id;
                      String namaKost = data["nama_kost"] ?? "";
                      String namaKategori = data["nama_katgeori"] ?? "";
                      String namaKamar = data["nama_kamar"] ?? "";

                      return KamarCard(
                        namaKost: namaKost,
                        namaKategori: namaKategori,
                        namaKamar: namaKamar,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 28);
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                } else if (snapshot.data == null) {
                  return Center(
                    child: Text(
                      "Data kosong",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }

                return Center(
                  child: SpinKitThreeBounce(
                    color: Pallete.primary,
                    size: 20,
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => AddKamarView(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
