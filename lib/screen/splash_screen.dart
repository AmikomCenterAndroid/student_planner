part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      Future.delayed(Duration.zero, () {
        Get.offAllNamed('/home', arguments: auth.currentUser.email);
      });
    } else {
      Get.offAllNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Lottie.asset('assets/animations/loading.json',
                width: 20, height: 20))
        .white
        .make();
  }
}
