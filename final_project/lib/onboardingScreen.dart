import 'package:final_project/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class onboardingScreen extends StatelessWidget {
  var controller = PageController();
  List pageContent = [
    {
      "image": "assets/easy.jpg",
      "title": "EASY SHOPPING",
      "description": "All you need is your mobile and a cozy bed or a sofa.",
    },
    {
      "image": "assets/money.jpg",
      "title": "SAVE MONEY",
      "description":
          "Compare prices of different brands and sellers and take the best decision.",
    },
    {
      "image": "assets/crowdfree.jpg",
      "title": " HATE CROWDS?!",
      "description":
          "Your perfect zone to get a crowd free, soothing shopping experience.",
    },
  ];

  onboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          buildPages(0, context),
          buildPages(1, context),
          buildPages(2, context)
        ],
      ),
    );
  }

  Container buildPages(pageIndex, ctx) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: pageIndex == 2 ? 80 : 20,
          ),
          Image.asset(pageContent[pageIndex]["image"]),
          const SizedBox(height: 25),
          Text(
            pageContent[pageIndex]["title"],
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 340,
            child: Text(
              pageContent[pageIndex]["description"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 40),
          PageViewDotIndicator(
            currentItem: pageIndex,
            count: 3,
            unselectedColor: Colors.black26,
            selectedColor: const Color.fromARGB(255, 219, 174, 50),
          ),
          const SizedBox(
            height: 20,
          ),
          pageIndex == 2
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    padding: const EdgeInsets.all(15),
                    color: const Color.fromARGB(255, 223, 172, 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.of(ctx)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return SignUp();
                      }));
                    },
                    child: const Text(
                      "START",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    controller.jumpToPage(2);
                  },
                  child: const Text(
                    "SKIP",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 87, 86, 86)),
                  ))
        ],
      ),
    );
  }
}
