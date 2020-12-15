part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TODO membuat desain login screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: VStack([
          VxBox(
              child: HStack(
            [titleMasuk, buttonDaftar],
            alignment: MainAxisAlignment.spaceBetween,
          )).width(context.screenWidth).make(),
          8.heightBox,
          descTitle,
          130.heightBox,
          MyTextfield(
            title: 'Email',
            hint: 'Enter your email',
          ),
          10.heightBox,
          MyTextfield(
            title: 'Password',
            hint: 'Enter your password',
          ),
          60.heightBox,
          MyButton(
            text: 'Login',
            onTap: () {
              print('Clicked');
            },
          ),
        ]).scrollVertical().p16()));
  }

  Widget titleMasuk = 'Masuk'.text.bold.size(36).make();

  Widget buttonDaftar = HStack([
    'Daftar'.text.hexColor('#FB7455').make(),
    16.widthBox,
    Icon(Icons.arrow_forward_ios),
  ]);

  Widget descTitle = "Belajar untuk produktif\nSetiap waktu".text.make();
}
