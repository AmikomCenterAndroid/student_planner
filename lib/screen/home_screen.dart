part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = Get.arguments;

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUser(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            return SafeArea(
                child: VStack([
              HStack(
                [
                  VStack([
                    'Gretting'.text.make(),
                    state.userModel.nama.text
                        .textStyle(blackFont)
                        .make()
                        .onTap(() {
                      context.read<UserCubit>().signOutUser();
                    }),
                  ]),
                  VxBox(
                          child: (state.userModel.photoUrl != null)
                              ? Image.network(
                                  state.userModel.photoUrl,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.error))
                      .red700
                      .size(46, 46)
                      .make()
                ],
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max,
              ).pOnly(left: 16, right: 16, top: 46)
            ]).scrollVertical());
          }
          return CircularProgressIndicator().centered();
        },
      ),
    );
  }
}
