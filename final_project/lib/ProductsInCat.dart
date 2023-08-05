import 'package:final_project/Categories.dart';
import 'package:flutter/material.dart';
import 'package:final_project/displayProducts.dart';
import 'package:final_project/userModel.dart';
import 'package:final_project/firebase.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isLoading = true;
  late userModel? u;

  @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    u = await firebase(Categories().getcat()).readProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 219, 174, 50),
          title: Text(
            Categories().getcat(),
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(child: displayProducts(u?.proList)),
    );
  }
}
