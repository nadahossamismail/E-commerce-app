import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Developers",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "This application has been developed as a Final project for ITI Summer Internship July 2023 by:",
              style: TextStyle(fontSize: 23),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "Nada Hossam Ismail",
            style:
                GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "CSED Student at Mansoura University.",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
