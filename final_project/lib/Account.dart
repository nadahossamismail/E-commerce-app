import 'package:final_project/appInfo.dart';
import 'package:final_project/developer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isLoading = true;

  var userName;
  var fisrtLetter;
  var userEmail;
  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString("email");
    userName = prefs.getString("name");
    fisrtLetter = prefs.getString("firstLetter");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    fisrtLetter,
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userName,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  userEmail,
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Text(
                        "About H&N",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => appInfo())),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Text(
                        "About us    ",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => developer())),
                      )
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
