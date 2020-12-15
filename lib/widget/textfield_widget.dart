part of 'widgets.dart';

class MyTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String title;

  const MyTextfield({Key key, this.hint, this.controller, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      title.text.xl.gray500.make(),
      VxBox(
              child: TextField(
        controller: controller ?? null,
        decoration: InputDecoration(
          hintText: hint ?? 'Not Found',
          border: InputBorder.none,
        ),
      ))
          .padding(EdgeInsets.symmetric(horizontal: 12, vertical: 6))
          .withRounded(value: 6)
          .hexColor('#F5F6FC')
          .make()
    ]);
  }
}
