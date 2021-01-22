part of 'utils.dart';

extension FirebaseUserExtension on User {
  Future<UserModel> fromFirestore() async =>
      await UserService.getUser(this.uid);

  UserModel convertToUser({String email, String nama}) =>
      UserModel(uid: this.uid, email: email, nama: nama);
}
