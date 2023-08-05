import 'package:final_project/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class firebase {
  String categoryName;

  firebase(this.categoryName);

  userModel user = userModel();
  Future<userModel?> readProducts() async {
    await FirebaseFirestore.instance
        .collection("Products")
        .doc(categoryName)
        .get()
        .then((value) {
      user = userModel.fromJson(value.data()!);
    });
    return user;
  }

  writeProducts(productList) async {
    final docUser =
        FirebaseFirestore.instance.collection("Products").doc(categoryName);

    final json = {"proList": productList};
    await docUser.set(json);
  }
}
