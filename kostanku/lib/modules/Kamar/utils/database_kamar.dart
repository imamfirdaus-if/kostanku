import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? _user = FirebaseAuth.instance.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("kamar");
DocumentReference _documentReference = _collectionReference.doc();
final Query _query = _collectionReference.where(
  "user_id",
  isEqualTo: _user!.uid,
);

class KamarDatabase {
  static Future<void> create({
    String? userId,
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
  }) async {
    Map<String, dynamic> data = {
      "user_id": _user!.uid,
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
    };

    await _documentReference
        .set(data)
        .whenComplete(() => log("Data ditambahkan"))
        .catchError((error) => log(error));
  }

  static Stream<QuerySnapshot> read() {
    return _query.snapshots();
  }

  static Future<void> update({
    required String documentId,
    String? userId,
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
  }) async {
    _documentReference = _documentReference.collection("kamar").doc(documentId);

    Map<String, dynamic> data = {
      "user_id": userId,
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
    };

    await _documentReference
        .update(data)
        .whenComplete(() => log("Data diubah"))
        .catchError((error) => log(error));
  }

  static Future<void> delete({
    required documentId,
  }) async {
    await _collectionReference
        .doc(documentId)
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
