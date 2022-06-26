import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference collectionReference = firestore.collection("kamar");

class KamarDatabase {
  static String? id;

  static Future<void> create({
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
  }) async {
    DocumentReference documentReference = collectionReference.doc();

    Map<String, dynamic> data = {
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
    };

    await documentReference
        .set(data)
        .whenComplete(() => log("Data ditambahkan"))
        .catchError((error) => log(error));
  }

  static Stream<QuerySnapshot> read() {
    return collectionReference.snapshots();
  }

  static Future<void> update({
    required String documentId,
    String? namaKost,
    String? namaKategori,
    String? namaKamar,
  }) async {
    DocumentReference documentReference =
        collectionReference.doc(id).collection("kamar").doc(documentId);

    Map<String, dynamic> data = {
      "nama_kost": namaKost,
      "nama_kategori": namaKategori,
      "nama_kamar": namaKamar,
    };

    await documentReference
        .update(data)
        .whenComplete(() => log("Data ditambahkan"))
        .catchError((error) => log(error));
  }

  static Future<void> delete({
    required documentId,
  }) async {
    DocumentReference documentReference =
        collectionReference.doc(id).collection("kamar").doc(documentId);

    await documentReference
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
