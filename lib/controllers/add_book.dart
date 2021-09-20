import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController {
  late TextEditingController judulC;
  late TextEditingController penulisC;
  late TextEditingController genreC;
  late TextEditingController sinopsisC;
  late TextEditingController statusC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addBook(String judul, String penulis, String genre, String sinopsis,
      String status) async {
    CollectionReference books = firestore.collection('books');

    try {
      await books.add({
        "judul": judul,
        "penulis": penulis,
        "genre": genre,
        "sinopsis": sinopsis,
        "status": status
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan buku",
        onConfirm: () => Get.back(),
        textConfirm: "Ok",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Berhasil menambah buku",
      );
    }
  }

  @override
  void onInit() {
    judulC = TextEditingController();
    penulisC = TextEditingController();
    genreC = TextEditingController();
    sinopsisC = TextEditingController();
    statusC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    judulC.dispose();
    penulisC.dispose();
    genreC.dispose();
    sinopsisC.dispose();
    statusC.dispose();
    super.onClose();
  }
}
