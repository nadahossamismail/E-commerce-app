import 'package:final_project/routes/sign_up.dart';
import 'package:final_project/widgets/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Login",
                style: GoogleFonts.playfairDisplay(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email must not be empty";
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 18),
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 18),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password must not be empty";
                  } else if (value.length < 6) {
                    return "Password is too short";
                  }

                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                controller: pass,
                obscureText: visible,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontSize: 18),
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: visible
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off))),
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color.fromARGB(255, 219, 174, 50),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: pass.text)
                        .then((value) async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await pref.setString("email", email.text);
                      await pref.setString("name",
                          email.text.substring(0, email.text.indexOf("@")));
                      await pref.setString(
                          "firstLetter", email.text[0].toUpperCase());
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => MainScreen()));
                    }).catchError((e) {
                      var s = AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        title: const Text(
                          "This account doesn't exist",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "OK",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            )),
                      );
                      showDialog(context: context, builder: (_) => s);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don\'t have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: const Text("Sign up",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
