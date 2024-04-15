import 'package:final_project/products_in_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var categoryName;

class Categories extends StatefulWidget {
  const Categories({super.key});

  getcat() {
    return categoryName;
  }

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categories = ["Women", "Men", "Bags", "watches"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) =>
                makeCard(context, categories[index]),
            itemCount: 4,
          ),
        )),
      ),
    ));
  }

  ListTile makeCard(context, name) {
    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      onTap: () {
        categoryName = name;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const Products()));
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45))),
      tileColor: const Color.fromARGB(255, 219, 174, 50),
      title: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.aboreto(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
