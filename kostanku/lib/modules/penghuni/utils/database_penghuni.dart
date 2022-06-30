import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? _user = FirebaseAuth.instance.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference =
    _firestore.collection("penghuni");
final Query query = _collectionReference.where(
  "user_id",
  isEqualTo: _user!.uid,
);
DocumentReference _documentReference = _collectionReference.doc();

class PenghuniDatabase {
  static String? id;

  static Future<void> create({
    String? userId,
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
    String? namaPenghuni,
    String? kontak,
    String? kontakDarurat,
    String? alamatAsal,
    String? pekerjaan,
  }) async {
    Map<String, dynamic> data = {
      "user_id": _user!.uid,
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
      "nama_penghuni": namaPenghuni,
      "kontak": kontak,
      "kontak_darurat": kontakDarurat,
      "alamat_asal": alamatAsal,
      "pekerjaan": pekerjaan,
    };

    await _documentReference
        .set(data)
        .whenComplete(() => log("Data ditambahkan"))
        .catchError((error) => log(error));
  }

  static Stream<QuerySnapshot> read() {
    return query.snapshots();
  }

  static Future<void> update({
    required String idPenghuni,
    String? userId,
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
    String? namaPenghuni,
    String? kontak,
    String? kontakDarurat,
    String? alamatAsal,
    String? pekerjaan,
  }) async {
    _documentReference =
        _documentReference.collection("penghuni").doc(idPenghuni);

    Map<String, dynamic> data = {
      "user_id": userId,
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
      "nama_penghuni": namaPenghuni,
      "kontak": kontak,
      "kontak_darurat": kontakDarurat,
      "alamat_asal": alamatAsal,
      "pekerjaan": pekerjaan,
    };

    await _collectionReference
        .doc(idPenghuni)
        .update(data)
        .whenComplete(() => log("Data diubah"))
        .catchError((error) => log("error"));
  }

  static Future<void> delete({
    required idPenghuni,
  }) async {
    await _collectionReference
        .doc(idPenghuni)
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
