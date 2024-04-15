import 'package:final_project/routes/categories.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/display_products.dart';
import 'package:final_project/models/user_model.dart';
import 'package:final_project/firebase.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isLoading = true;
  late UserModel? u;
  var women = [
    {"image": "assets/c1.jpg", "name": "Top 240", "price": "\$105"},
    {"image": "assets/c2.jpg", "name": "Dress 056", "price": "\$427"},
    {"image": "assets/c3.jpg", "name": "Dress 010", "price": "\$280"},
    {"image": "assets/c4.jpg", "name": "Dress 308", "price": "\$530"},
    {"image": "assets/c5.jpg", "name": "Top 231", "price": "\$190"},
    {"image": "assets/c6.jpg", "name": "Dress 845", "price": "\$352"}
  ];

  @override
  void initState() {
    Firebase("Women").writeProducts(women);
    get();
    super.initState();
  }

  get() async {
    u = await Firebase(const Categories().getcat()).readProducts();
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
            const Categories().getcat(),
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(child: DisplayProducts(u?.proList)),
    );
  }
}
