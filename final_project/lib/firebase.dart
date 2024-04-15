import 'package:final_project/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {
  String categoryName;

  Firebase(this.categoryName);

  UserModel user = UserModel();
  Future<UserModel?> readProducts() async {
    await FirebaseFirestore.instance
        .collection("Products")
        .doc(categoryName)
        .get()
        .then((value) {
      user = UserModel.fromJson(value.data()!);
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
