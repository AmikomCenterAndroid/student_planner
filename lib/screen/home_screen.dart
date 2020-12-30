part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text(uid).onTap(() {
        AuthServices.signOut();
        Get.offAllNamed('splash');
      })),
    );
  }
}
