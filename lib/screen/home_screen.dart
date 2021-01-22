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
                    'Selamat ${greeting()},'.text.make(),
                    state.userModel.nama.text
                        .textStyle(blackFont)
                        .make()
                        .onTap(() {
                      context.read<UserCubit>().signOutUser();
                    }),
                  ]),
                  VxBox(
                          child: (state.userModel.photoUrl != null)
                              ? CachedNetworkImage(
                                  imageUrl: state.userModel.photoUrl,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          )),
                                    );
                                  },
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                )
                              : Icon(Icons.error))
                      .size(46, 46)
                      .make()
                      .onTap(() async {
                    File image = await getImage();
                    String photoUrl = await UserService.uploadImage(uid, image);
                    UserService.updateUser(uid, photoUrl);
                    context.read<UserCubit>().loadUser(uid);
                    //Upload Service
                  }),
                ],
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max,
              ).pOnly(left: 16, right: 16, top: 46),
            ]).scrollVertical());
          }
          return CircularProgressIndicator().centered();
        },
      ),
    );
  }
}
