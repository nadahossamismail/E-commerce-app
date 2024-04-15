import 'package:final_project/routes/profile_screen.dart';
import 'package:final_project/routes/categories.dart';
import 'package:final_project/routes/home_screen.dart';
import 'package:final_project/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentTab = 0;
  bool notification = true;
  var pages = [const HomeScreen(), const Categories(), const ProfileScreen()];
  var pageTitle = ["FOR YOU", "Categories", "Account"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            pageTitle[currentTab],
            style: GoogleFonts.notoSerif(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: currentTab == 0
              ? [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        makeToast("No favorite items yet");
                      });
                    },
                  ),
                  Stack(children: [
                    IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            notification = false;
                            makeToast("We Are Happy to have you here!");
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: CircleAvatar(
                          radius: 4,
                          backgroundColor: notification
                              ? const Color.fromARGB(255, 187, 140, 13)
                              : Colors.transparent),
                    ),
                  ]),
                ]
              : currentTab == 1
                  ? [
                      Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.tune,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () => makeToast(
                                "It is just 22 items, you can do it :)"),
                          ))
                    ]
                  : [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove("email");
                            pref.remove("name");
                            pref.remove("firstLetter");
                            setState(() {
                              makeToast("Sign out completed successfully");
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            });
                          },
                          icon: const Icon(Icons.logout),
                          color: Colors.black,
                        ),
                      )
                    ]),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: currentTab,
          iconSize: 30,
          selectedItemColor: Colors.black,
          selectedFontSize: 17,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me")
          ],
          onTap: (val) => setState(() {
                currentTab = val;
              })),
      body: pages[currentTab],
    );
  }

  makeToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amberAccent,
        textColor: Colors.black,
        fontSize: 17.0);
  }
}
