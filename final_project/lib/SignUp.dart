import 'package:final_project/mainScreen.dart';
import 'package:final_project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Sign-up",
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  makeTextForm(
                      "Your Name", username, TextInputType.name, Icons.person,
                      (value) {
                    if (value!.isEmpty) {
                      return "What should we call you?";
                    }
                    return null;
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  makeTextForm(
                    "Email",
                    email,
                    TextInputType.emailAddress,
                    Icons.email,
                    (value) {
                      if (value!.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 8) {
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
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: const Color.fromARGB(255, 219, 174, 50),
                      child: const Text(
                        "sign up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email.text, password: pass.text);
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            await pref.setString("email", email.text);
                            await pref.setString("name", username.text);
                            await pref.setString(
                                "firstLetter", username.text[0].toUpperCase());
                            pass.clear();
                            email.clear();
                            username.clear();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => mainScreen()));
                          } on FirebaseAuthException catch (e) {
                            var s = AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              title: Text(
                                e.message.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              content: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  )),
                            );
                            showDialog(context: context, builder: (_) => s);
                          }
                        }
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
                        "have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) {
                              return loginScreen();
                            }));
                          },
                          child: const Text("Login",
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

  TextFormField makeTextForm(lable, controller, keyboard, icon, validate) {
    return TextFormField(
        validator: validate,
        style: const TextStyle(fontSize: 18),
        keyboardType: keyboard,
        controller: controller,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(fontSize: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
        ));
  }
}
