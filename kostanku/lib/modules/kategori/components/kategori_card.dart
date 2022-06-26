// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/kategori/views/add_kategori_view.dart';

class CategoryCard extends StatelessWidget {
  String? idKategori;
  String namaKategori;
  String fasilitas;
  String harga;

  CategoryCard(
      {Key? key,
      required this.idKategori,
      required this.namaKategori,
      required this.fasilitas,
      required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddKategoriView(
              isEdit: true,
              idKategori: idKategori,
              namaKategori: namaKategori,
              fasilitas: fasilitas,
              harga: harga,
            ),
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
                child: _buildKategoriName(),
              ),
              SizedBox(height: 16),
              _buildKategoriInformation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKategoriName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
      decoration: BoxDecoration(
        color: Pallete.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        namaKategori,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildKategoriInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fasilitas     : $fasilitas',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 4),
        Text(
          'Harga        : $harga /perbulan',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
