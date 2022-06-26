// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/penghuni/views/add_DataPenghuni_view.dart';

class PenghuniCard extends StatelessWidget {
  String? idPenghuni;
  String namaKost;
  String namaKategori;
  String namaKamar;
  String namaPenghuni;
  String kontak;
  String kontakDarurat;
  String alamatAsal;
  String pekerjaan;
  PenghuniCard(
      {Key? key,
      required this.idPenghuni,
      required this.namaKost,
      required this.namaKategori,
      required this.namaKamar,
      required this.namaPenghuni,
      required this.kontak,
      required this.kontakDarurat,
      required this.alamatAsal,
      required this.pekerjaan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddPenghuniView(
                isEdit: true,
                idPenghuni: idPenghuni,
                namaKost: namaKost,
                namaKategori: namaKategori,
                namaKamar: namaKamar,
                namaPenghuni: namaPenghuni,
                kontak: kontak,
                kontakDarurat: kontakDarurat,
                alamatAsal: alamatAsal,
                pekerjaan: pekerjaan),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _buildPenghuniName(),
              ),
              SizedBox(height: 16),
              _buildPenghuniInformation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPenghuniName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
      decoration: BoxDecoration(
        color: Pallete.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        namaPenghuni,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildPenghuniInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kost     : $namaKost',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          'Kategori     : $namaKategori',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          'Kontak        : $kontak',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
