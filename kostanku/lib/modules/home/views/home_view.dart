// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kostanku/constants/pallete.dart';
import 'package:kostanku/modules/Kamar/views/list_dataKamar_view.dart';
import 'package:kostanku/modules/home/components/grid_item.dart';
import 'package:kostanku/modules/home/components/report_item.dart';
import 'package:kostanku/modules/kategori/views/list_kategori_view.dart';
import 'package:kostanku/modules/kost/views/list_kost_view.dart';
import 'package:kostanku/modules/penghuni/views/list_penghuni_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> gridItemTitles = [
    'Daftar Kost',
    'Daftar Kategori',
    'Daftar Kamar',
    'Daftar Penghuni',
  ];

  List gridItemNavigator = [
    ListKostView(),
    ListKategoriView(),
    ListDataKamar(),
    ListPenghuniView(),
  ];

  List<String> iconUrls = [
    'assets/svgs/jumlah_kost.svg',
    'assets/svgs/kategori_kost.svg',
    'assets/svgs/penghuni_kost.svg',
    'assets/svgs/kamar_terisi.svg',
    'assets/svgs/kamar_kosong.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeSection(),
          SizedBox(height: 40),
          _buildReport(),
          SizedBox(height: 40),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Farhan Rizky',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Selamat Datang di Kostanku!',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Widget _buildReport() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Laporanmu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4),
          Flexible(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                return ReportItem(
                  iconUrl: iconUrls[index],
                  title: 'Jumlah Kost',
                  number: '5',
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Flexible(
      flex: 2,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: 24),
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          gridItemTitles.length,
          (index) => GridItem(
            title: gridItemTitles[index],
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => gridItemNavigator[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
