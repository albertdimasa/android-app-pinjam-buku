import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ReadBookController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference books = firestore.collection("books");
    return books.snapshots();
  }
}
