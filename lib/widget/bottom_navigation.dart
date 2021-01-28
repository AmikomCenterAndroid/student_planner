part of 'widgets.dart';

class CustomNavBar extends StatelessWidget {
  final int index;
  final Function(int index) function;

  const CustomNavBar({Key key, this.index, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: HStack(
        [
          WebsafeSvg.asset('assets/icons/home.svg',
                  color: (index == 0) ? Vx.blue600 : Vx.gray600)
              .onTap(() {
            if (function != null) {
              function(0);
            }
          }),
          WebsafeSvg.asset('assets/icons/document.svg',
                  color: (index == 1) ? Vx.blue600 : Vx.gray600)
              .onTap(() {
            if (function != null) {
              function(1);
            }
          }),
          WebsafeSvg.asset('assets/icons/profile.svg',
                  color: (index == 2) ? Vx.blue600 : Vx.gray600)
              .onTap(() {
            if (function != null) {
              function(2);
            }
          }),
        ],
        alignment: MainAxisAlignment.spaceAround,
        axisSize: MainAxisSize.max,
      ).p16(),
    ).make();
  }
}
