import 'package:flutter/material.dart';
import 'package:kostanku/modules/Kamar/views/list_dataKamar_view.dart';
import 'package:kostanku/modules/kost/views/list_kost_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListKostView(),
                  ),
                );
              },
              child: Text('Daftar Kost'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListDataKamar(),
                  ),
                );
              },
              child: Text('Data Kamar'),
            ),
          ],
        ),
      ),
    );
  }
}
