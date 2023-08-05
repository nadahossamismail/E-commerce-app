import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class appInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "H&N",
            style: GoogleFonts.aboreto(fontSize: 33, color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text(
                "We are an E-commerce application exists merely to help you with your shopping experience.",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
                child:
                    Text("Rate us please :)", style: TextStyle(fontSize: 22))),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) => value,
            )
          ],
        ),
      ),
    );
  }
}
