part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserResult> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return UserResult(user: userCredential.user);
    } on FirebaseAuthException catch (e) {
      return UserResult(
          message: e.toString().split('/')[1].split(']')[1].trim());
    }
  }

  static Future<UserResult> signUp(
      String email, String password, UserModel userModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = userCredential.user.convertToUser(
        email: email,
        nama: userModel.nama,
      );

      await UserService.setUser(user);

      return UserResult(user: userCredential.user);
    } on FirebaseAuthException catch (e) {
      return UserResult(
          message: e.toString().split('/')[1].split(']')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Stream<User> get userStream => auth.authStateChanges();
}

class UserResult {
  final String message;
  final User user;

  UserResult({this.message, this.user});
}
