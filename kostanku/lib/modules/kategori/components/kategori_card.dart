// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';

class categoryCard extends StatelessWidget {
  String nama_kategori;
  String fasilitas;
  String harga;

  categoryCard(
      {Key? key,
      required this.nama_kategori,
      required this.fasilitas,
      required this.harga})
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
              child: _buildCategoryKost(),
            ),
            SizedBox(height: 20),
            _buildFacility(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryKost() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
      decoration: BoxDecoration(
        color: Pallete.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        nama_kategori,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildFacility() {
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
          'Harga          : $harga /perbulan',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
