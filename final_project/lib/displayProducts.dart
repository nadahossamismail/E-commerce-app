import 'package:flutter/material.dart';

class displayProducts extends StatelessWidget {
  List? productList;
  displayProducts(this.productList, {super.key});
  @override
  Widget build(BuildContext context) {
    return display(productList);
  }
}

SizedBox display(List? productList) {
  return SizedBox(
    width: double.infinity,
    child: Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            mainAxisSpacing: 15,
            childAspectRatio: 0.8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(productList!.length, (i) {
              return createProduct(productList[i]["image"],
                  productList[i]["name"], productList[i]["price"]);
            })),
      ),
    ),
  );
}

Container createProduct(image, name, price) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Image.asset(
          image,
          width: 180,
          height: 200,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          price,
          style: const TextStyle(fontSize: 20, color: Colors.brown),
        ),
      ],
    ),
  );
}
