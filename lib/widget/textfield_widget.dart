part of 'widgets.dart';

class MyTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String title;
  final bool isPassword;

  const MyTextfield(
      {Key key,
      this.hint,
      this.controller,
      @required this.title,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      title.text.gray500.make(),
      VxBox(
              child: TextField(
        controller: controller ?? null,
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          hintText: hint ?? 'Not Found',
          hintStyle: TextStyle(fontSize: 14),
          border: InputBorder.none,
        ),
      ))
          .padding(EdgeInsets.symmetric(horizontal: 14, vertical: 4))
          .withRounded(value: 6)
          .hexColor('#F5F6FC')
          .make()
    ]);
  }
}
