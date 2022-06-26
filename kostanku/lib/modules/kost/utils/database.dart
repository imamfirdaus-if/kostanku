import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference collectionReference = firestore.collection("kost");

class KostDatabase {
  static String? id;

  static Future<void> create({
    String? namaKost,
    String? namaPemilik,
    String? nomorHP,
    String? alamat,
  }) async {
    DocumentReference documentReference = collectionReference.doc();

    Map<String, dynamic> data = {
      "nama_kost": namaKost,
      "nama_pemilik": namaPemilik,
      "nomor_hp": nomorHP,
      "alamat": alamat,
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
    String? namaPemilik,
    String? nomorHP,
    String? alamat,
  }) async {
    DocumentReference documentReference =
        collectionReference.doc(id).collection("kost").doc(documentId);

    Map<String, dynamic> data = {
      "nama_kost": namaKost,
      "nama_pemilik": namaPemilik,
      "nomor_hp": nomorHP,
      "alamat": alamat,
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
        collectionReference.doc(id).collection("kost").doc(documentId);

    await documentReference
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
