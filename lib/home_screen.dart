import 'package:flutter/material.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.login,
              color: Colors.white,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              removeValues();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Username: ${getUserNameValuesSF()}"),
            Text("Username: ${getPasswordValuesSF()}"),
          ],
        ),
      ),
    );
  }

  getUserNameValuesSF() {
    String? userNameValue = prefs?.getString('username');
    return userNameValue;
  }

  getPasswordValuesSF() {
    String? passwordValue = prefs?.getString('password');
    return passwordValue;
  }

  removeValues() {
    prefs?.remove("username");
    prefs?.remove("password");
  }
}
