part of 'services.dart';

class TaskService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> setTask(String uid, TaskModel task) async {
    userCollection.doc(uid).collection('tasks').doc(task.taskId).set({
      'taskId': task.taskId,
      'judul': task.judul,
      'keterangan': task.keterangan,
      'gambar': task.gambar,
    });
  }

  static Future<String> uploadImage(
      String uid, File image, String taskId) async {
    String fileName = 'task/$uid/$taskId.png';

    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(image);
    TaskSnapshot snapshot = await task.whenComplete(() => ref.getDownloadURL());

    return snapshot.ref.getDownloadURL();
  }

  //CATATAN DIDUBAH
  static Future<UserModel> getTask(String uid) async {
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();

    Map<String, dynamic> data = snapshot.data();

    return UserModel(
        uid: uid,
        email: data['email'],
        nama: data['nama'],
        photoUrl: data['photoUrl']);
  }
}
