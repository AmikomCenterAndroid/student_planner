import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Check your internet connection');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            initialRoute: '/login',
            getPages: [
              GetPage(name: '/login', page: () => LoginScreen()),
            ],
            theme: ThemeData(primarySwatch: Colors.purple),
            title: "Student Planner",
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
