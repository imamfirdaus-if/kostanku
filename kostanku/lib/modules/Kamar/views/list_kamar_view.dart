// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kamar/components/kamar_card.dart';
import 'package:kostanku/modules/kamar/utils/database_kamar.dart';
import 'package:kostanku/modules/kamar/views/add_kamar_view.dart';

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
                  child: Text(
                    "Terjadi kesalahan, silahkan coba lagi nanti",
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasData) {
                var snapshotData = snapshot.data!;

                if (snapshotData.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "Tidak ada data",
                      style: TextStyle(
                        color: Pallete.disabled,
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data() as dynamic;
                      String documentId = snapshot.data!.docs[index].id;
                      String namaKost = data["nama_kost"] ?? "";
                      String namaKategori = data["nama_kategori"] ?? "";
                      String namaKamar = data["nama_kamar"] ?? "";

                      return KamarCard(
                        documentId: documentId,
                        namaKost: namaKost,
                        namaKategori: namaKategori,
                        namaKamar: namaKamar,
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AddKamarView(
                              isEdit: true,
                              documentId: documentId,
                              namaKamar: namaKamar,
                              namaKost: namaKost,
                              namaKategori: namaKategori,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 28);
                    },
                    itemCount: snapshotData.docs.length,
                  );
                }
              }

              return Center(
                child: SpinKitThreeBounce(
                  color: Pallete.primary,
                  size: 20,
                ),
              );
            },
          ),
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
