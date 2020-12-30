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

  static Future<UserModel> getUser(String uid) async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();

    Map<String, dynamic> data = snapshot.data();

    return UserModel(
      uid: uid,
      email: data['email'],
      nama: data['nama'],
    );
  }
}
