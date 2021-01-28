part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = Get.arguments;
  int selectedIndex = 0;

  PageController page;

  @override
  void initState() {
    super.initState();
    page = PageController(initialPage: selectedIndex);
    context.read<UserCubit>().loadUser(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZStack([
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: page,
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          children: [
            Dashboard(uid: uid),
            ListTugas(),
            Profile(),
          ],
        ).pOnly(bottom: 70),
        CustomNavBar(
          index: selectedIndex,
          function: (index) {
            setState(() {
              selectedIndex = index;
              page.jumpToPage(selectedIndex);
            });
          },
        ).objectBottomCenter()
      ]),
    );
  }
}
