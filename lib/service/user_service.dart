part of 'services.dart';

class UserService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> setUser(UserModel user) async {
    userCollection.doc(user.uid).set({
      'uid': user.uid,
      'nama': user.nama,
      'email': user.email,
    });
  }
}
