import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference collectionReference =
    firestore.collection("kategori");

class KategoriDatabase {
  static String? id;

  static Future<void> create({
    String? nama_kategori,
    String? fasilitas,
    String? harga,
  }) async {
    DocumentReference documentReference = collectionReference.doc();

    Map<String, dynamic> data = {
      "Nama kategori": nama_kategori,
      "Fasilitas": fasilitas,
      "Harga": harga,
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
    String? nama_kategori,
    String? fasilitas,
    String? harga,
  }) async {
    DocumentReference documentReference =
        collectionReference.doc(id).collection("kategori").doc(documentId);

    Map<String, dynamic> data = {
      "Nama kategori": nama_kategori,
      "Fasilitas": fasilitas,
      "Harga": harga,
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
        collectionReference.doc(id).collection("kategori").doc(documentId);

    await documentReference
        .delete()
        .whenComplete(() => log("Data dihapus"))
        .catchError((error) => log(error));
  }
}
