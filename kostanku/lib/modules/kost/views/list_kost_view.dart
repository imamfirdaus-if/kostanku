// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kost/components/kost_card.dart';
import 'package:kostanku/modules/kost/utils/database.dart';
import 'package:kostanku/modules/kost/views/add_kost_view.dart';

class ListKostView extends StatefulWidget {
  const ListKostView({Key? key}) : super(key: key);

  @override
  State<ListKostView> createState() => _ListKostViewState();
}

class _ListKostViewState extends State<ListKostView> {
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
          'Daftar Kost',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        StreamBuilder<QuerySnapshot>(
            stream: KostDatabase.read(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else if (snapshot.hasData || snapshot.data != null) {
                return Flexible(
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data() as dynamic;
                      // String documentId = snapshot.data!.docs[index].id;
                      String namaKost = data["nama_kost"] ?? "";
                      String namaPemilik = data["nama_pemilik"] ?? "";
                      String nomorHP = data["nomor_hp"] ?? "";
                      String alamat = data["alamat"] ?? "";

                      return KostCard(
                        kostName: namaKost,
                        ownerName: namaPemilik,
                        phoneNumber: nomorHP,
                        address: alamat,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 28);
                    },
                    itemCount: snapshot.data!.docs.length,
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
      ],
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => AddKostView(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
