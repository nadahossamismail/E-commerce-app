import 'package:final_project/mainScreen.dart';
import 'package:final_project/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(MainApp(email));
}

class MainApp extends StatelessWidget {
  var email;
  MainApp(this.email);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? splashScreen() : mainScreen(),
    );
  }
}
