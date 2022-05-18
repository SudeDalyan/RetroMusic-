import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset("assets/appLogo.png"),
        ),
      ),
    );
  }
}
