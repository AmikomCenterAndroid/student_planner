import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
      theme: ThemeData(primarySwatch: Colors.purple),
      title: "Student Planner",
    );
  }
}
