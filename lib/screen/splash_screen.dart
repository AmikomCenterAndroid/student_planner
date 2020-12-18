import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() async {
    super.initState();
    if (auth.currentUser != null) {
      await Get.offAllNamed('/home', arguments: auth.currentUser.email);
    } else {
      await Get.offAllNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
