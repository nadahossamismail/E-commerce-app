import 'package:final_project/firebase.dart';
import 'package:final_project/displayProducts.dart';
import 'package:final_project/userModel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var offers = [
    "assets/home1.jpg",
    "assets/home2.jpg",
    "assets/home3.jpg",
    "assets/home4.jpg"
  ];

  bool isLoading = true;
  var sliderindex = 0;
  late userModel? u;
  get() async {
    u = await firebase("Popular Products").readProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                            items: offers.map((e) {
                              return Container(
                                child: Image.asset(
                                  e,
                                  fit: BoxFit.fill,
                                  width: 400,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                                height: 200,
                                initialPage: 0,
                                enlargeCenterPage: true,
                                pauseAutoPlayOnTouch: true,
                                onPageChanged: (index, _) {
                                  setState(() {
                                    sliderindex = index;
                                  });
                                },
                                autoPlay: true)),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "Popular Products",
                            style: GoogleFonts.raleway(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        displayProducts(u!.proList)
                      ]),
                ),
              ));
  }
}
