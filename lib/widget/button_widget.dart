part of 'widgets.dart';

class MyButton extends StatelessWidget {
  final String hexColor;
  final String text;
  final Function onTap;

  const MyButton(
      {Key key, this.hexColor, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(child: text.text.white.xl.makeCentered())
        .p12
        .roundedSM
        .width(context.screenWidth * 0.6)
        .hexColor(hexColor ?? '#5E51C7')
        .makeCentered()
        .onTap(onTap);
  }
}
