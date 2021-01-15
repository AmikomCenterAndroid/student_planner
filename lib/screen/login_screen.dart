part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: VStack([
          VxBox(
              child: HStack(
            [
              titleMasuk,
              buttonDaftar,
            ],
            alignment: MainAxisAlignment.spaceBetween,
          )).width(context.screenWidth).make(),
          8.heightBox,
          descTitle,
          130.heightBox,
          MyTextfield(
            title: 'Email',
            controller: emailController,
            hint: 'Masukkan email kamu',
          ),
          10.heightBox,
          MyTextfield(
            isPassword: true,
            controller: passController,
            title: 'Password',
            hint: 'Masukkan password kamu',
          ),
          60.heightBox,
          MyButton(
            text: 'Masuk',
            onTap: () async {
              context.read<UserCubit>().signInUser(context,
                  emailController.text.trim(), passController.text.trim());
            },
          ),
        ]).scrollVertical().p16()));
  }

  Widget titleMasuk = 'Masuk'.text.bold.size(36).make();

  Widget buttonDaftar = HStack([
    'Daftar'.text.hexColor('#FB7455').make(),
    16.widthBox,
    Icon(Icons.arrow_forward_ios),
  ]).onTap(() {
    Get.toNamed('/register');
  });

  Widget descTitle = "Belajar untuk produktif\nSetiap waktu".text.make();
}
