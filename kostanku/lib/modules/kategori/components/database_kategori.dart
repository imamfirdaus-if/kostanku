import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('kategori');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String nama_kategori,
    required String fasilitas,
    required String harga,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Nama kategori": nama_kategori,
      "Fasilitas": fasilitas,
      "harga": harga,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Kategori telah ditambahkan"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String nama_kategori,
    required String fasilitas,
    required String harga,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Nama kategori": nama_kategori,
      "Fasilitas": fasilitas,
      "harga": harga,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Kategori telah diperbaharui"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('kategori');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Kategori telah dihapus'))
        .catchError((e) => print(e));
  }
}
