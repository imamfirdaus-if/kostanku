import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? _user = FirebaseAuth.instance.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference =
    _firestore.collection("kategori");
final Query query = _collectionReference.where(
  "user_id",
  isEqualTo: _user!.uid,
);
DocumentReference _documentReference = _collectionReference.doc();

class KategoriDatabase {
  static String? id;

  static Future<void> create({
    String? namaKategori,
    String? fasilitas,
    String? harga,
  }) async {
    Map<String, dynamic> data = {
      "nama_kategori": namaKategori,
      "fasilitas": fasilitas,
      "harga": harga,
    };

    await _documentReference
        .set(data)
        .whenComplete(() => log("Data ditambahkan"))
        .catchError((error) => log(error));
  }

  static Stream<QuerySnapshot> read() {
    return _collectionReference.snapshots();
  }

  static Future<void> update({
    required String idKategori,
    String? userId,
    String? namaKategori,
    String? fasilitas,
    String? harga,
  }) async {
    _documentReference =
        _documentReference.collection("kategori").doc(idKategori);

    Map<String, dynamic> data = {
      "user_id": userId,
      "nama_kategori": namaKategori,
      "fasilitas": fasilitas,
      "harga": harga,
    };

    await _collectionReference
        .doc(idKategori)
        .update(data)
        .whenComplete(() => log("Data diubah"))
        .catchError((error) => log("error"));
  }

  static Future<void> delete({
    required idKategori,
  }) async {
    await _collectionReference
        .doc(idKategori)
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
