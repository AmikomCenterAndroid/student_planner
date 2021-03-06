import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:student_planner/cubit/user_cubit.dart';
import 'screen/screens.dart';
import 'service/services.dart';

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
          return StreamProvider.value(
            value: AuthServices.userStream,
            child: bloc.MultiBlocProvider(
              providers: [
                bloc.BlocProvider(create: (context) => UserCubit()),
              ],
              child: GetMaterialApp(
                initialRoute: '/splash',
                getPages: [
                  GetPage(
                      name: '/login',
                      page: () => LoginScreen(),
                      transition: Transition.cupertino),
                  GetPage(
                      name: '/splash',
                      page: () => SplashScreen(),
                      transition: Transition.cupertino),
                  GetPage(
                      name: '/register',
                      page: () => RegisterScreen(),
                      transition: Transition.rightToLeft),
                  GetPage(name: '/home', page: () => HomeScreen()),
                ],
                theme: ThemeData(primarySwatch: Colors.purple),
                title: "Student Planner",
              ),
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
