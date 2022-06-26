// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

class KamarCard extends StatelessWidget {
  String namaKost;
  String namaKategori;
  String namaKamar;
  KamarCard(
      {Key? key,
      required this.namaKost,
      required this.namaKategori,
      required this.namaKamar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: _buildKamarName(),
            ),
            SizedBox(height: 16),
            _buildKamarInformation(),
          ],
        ),
      ),
    );
  }

  Widget _buildKamarName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
      decoration: BoxDecoration(
        color: Pallete.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        namaKamar,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildKamarInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Kost  : $namaKost',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          'Kategori   : $namaKategori',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
