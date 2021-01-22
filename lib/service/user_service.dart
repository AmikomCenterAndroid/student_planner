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

  static Future<void> updateUser(String uid, String url) async {
    userCollection.doc(uid).update({
      'photoUrl': url,
    });
  }

  static Future<String> uploadImage(String uid, File image) async {
    String fileName = 'profile/$uid/profile.png';

    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(image);
    TaskSnapshot snapshot = await task.whenComplete(() => ref.getDownloadURL());

    return snapshot.ref.getDownloadURL();
  }

  static Future<UserModel> getUser(String uid) async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();

    Map<String, dynamic> data = snapshot.data();

    return UserModel(
        uid: uid,
        email: data['email'],
        nama: data['nama'],
        photoUrl: data['photoUrl']);
  }
}
