import 'package:final_project/widgets/main_screen.dart';
import 'package:final_project/routes/splash_screen.dart';
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
  final String? email;
  const MainApp(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? const SplashScreen() : const MainScreen(),
    );
  }
}
