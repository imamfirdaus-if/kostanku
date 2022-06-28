// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/penghuni/components/penghuni_grid_item.dart';
import 'package:kostanku/modules/penghuni/utils/database_penghuni.dart';
import 'package:kostanku/modules/penghuni/views/add_DataPenghuni_view.dart';

class ListPenghuniView extends StatefulWidget {
  const ListPenghuniView({Key? key}) : super(key: key);

  @override
  State<ListPenghuniView> createState() => _ListPenghuniViewState();
}

class _ListPenghuniViewState extends State<ListPenghuniView> {
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
          'Daftar Penghuni',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        StreamBuilder<QuerySnapshot>(
            stream: PenghuniDatabase.read(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else if (snapshot.hasData || snapshot.data != null) {
                return Flexible(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data() as dynamic;
                      // String idPenghuni = snapshot.data!.docs[index].id;
                      String namaKost = data["nama_kost"] ?? "";
                      String namaKategori = data["nama_kategori"] ?? "";
                      // String namakamar = data["nama_kamar"] ?? "";
                      String namaPenghuni = data["nama_penghuni"] ?? "";
                      // String kontak = data["kontak"] ?? "";
                      String kontakDarurat = data["kontak_darurat"] ?? "";
                      // String alamatAsal = data["alamat"] ?? "";
                      // String pekerjaan = data["pekerjaan"] ?? "";

                      return PenghuniGridItem(
                        name: namaPenghuni,
                        kostName: namaKost,
                        kostCategory: namaKategori,
                        phoneNumber: kontakDarurat,
                      );
                      // return PenghuniCard(
                      //   idPenghuni: idPenghuni,
                      //   namaKost: namaKost,
                      //   namaKategori: namaKategori,
                      //   namaKamar: namakamar,
                      //   namaPenghuni: namaPenghuni,
                      //   kontak: kontak,
                      //   kontakDarurat: kontakDarurat,
                      //   alamatAsal: alamatAsal,
                      //   pekerjaan: pekerjaan,
                      // );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                  //   child: ListView.separated(
                  //     padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
                  //     physics: BouncingScrollPhysics(),
                  //     itemBuilder: (context, index) {
                  //       var data = snapshot.data!.docs[index].data() as dynamic;
                  //       String idPenghuni = snapshot.data!.docs[index].id;
                  //       String namaKost = data["nama_kost"] ?? "";
                  //       String namaKategori = data["nama_kategori"] ?? "";
                  //       String namakamar = data["nama_kamar"] ?? "";
                  //       String namaPenghuni = data["nama_penghuni"] ?? "";
                  //       String kontak = data["kontak"] ?? "";
                  //       String kontakDarurat = data["kontak_darurat"] ?? "";
                  //       String alamatAsal = data["alamat"] ?? "";
                  //       String pekerjaan = data["pekerjaan"] ?? "";

                  //       return PenghuniCard(
                  //         idPenghuni: idPenghuni,
                  //         namaKost: namaKost,
                  //         namaKategori: namaKategori,
                  //         namaKamar: namakamar,
                  //         namaPenghuni: namaPenghuni,
                  //         kontak: kontak,
                  //         kontakDarurat: kontakDarurat,
                  //         alamatAsal: alamatAsal,
                  //         pekerjaan: pekerjaan,
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return SizedBox(height: 28);
                  //     },
                  //     itemCount: snapshot.data!.docs.length,
                  //   ),
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
          builder: (context) => AddPenghuniView(),
        ),
      ),
      backgroundColor: Pallete.secondary,
      child: Icon(Icons.add),
    );
  }
}
