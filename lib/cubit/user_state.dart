part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadedState extends UserState {
  final UserModel userModel;

  UserLoadedState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class LoadUserState extends UserState {
  final String uid;

  LoadUserState(this.uid);

  @override
  List<Object> get props => [uid];
}

class SignOutState extends UserState {}

class SignInProcessState extends UserState {}
