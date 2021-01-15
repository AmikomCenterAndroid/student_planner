import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../model/models.dart';
import '../service/services.dart';
import '../service/services.dart';
import '../util/utils.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void loadUser(String uid) async {
    emit(LoadUserState(uid));
    UserModel user = await UserService.getUser(uid);
    emit(UserLoadedState(user));
  }

  void signOutUser() async {
    emit(SignOutState());
    await AuthServices.signOut();
    Get.offAllNamed('/login');
  }

  void signInUser(BuildContext context, String email, String password) async {
    emit(SignInProcessState());
    progressDialog(context).show();

    UserResult user = await AuthServices.signIn(email, password);
    if (user.user == null) {
      Get.snackbar('Masuk', user.message);
      progressDialog(context).dismiss();
    } else {
      Get.offAllNamed('/home', arguments: user.user.uid);
      progressDialog(context).dismiss();
    }
  }
}
