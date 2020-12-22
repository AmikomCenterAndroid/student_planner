part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget buttonMasuk = HStack([
    Icon(Icons.arrow_back_ios_outlined),
    16.widthBox,
    'Masuk'.text.hexColor('#FB7455').make(),
  ]).onTap(() {
    Get.back();
  });

  Widget titleDaftar = 'Daftar'.text.bold.size(36).make();

  Widget descTitle() {
    return VxBox(
      child: "Belajar untuk produktif\nSetiap waktu".text.end.make(),
    ).make().wFull(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: VStack([
          VxBox(
              child: HStack(
            [
              buttonMasuk,
              titleDaftar,
            ],
            alignment: MainAxisAlignment.spaceBetween,
          )).width(context.screenWidth).make(),
          8.heightBox,
          descTitle(),
          130.heightBox,
          MyTextfield(
            controller: emailController,
            title: 'Email',
            hint: 'Masukkan email kamu',
          ),
          10.heightBox,
          MyTextfield(
            controller: passController,
            isPassword: true,
            title: 'Password',
            hint: 'Masukkan password kamu',
          ),
          60.heightBox,
          MyButton(
            text: 'Daftar',
            onTap: () async {
              String email = emailController.text.trim();
              String password = passController.text.trim();

              User user = await AuthServices.signUp(email, password);
              if (user != null) {
                Get.offAllNamed('/home', arguments: user.email);
              } else {
                Get.snackbar('Daftar', 'Akun $email gagal mendaftar');
              }
            },
          ),
        ]).scrollVertical().p16()));
  }
}
