part of 'models.dart';

class UserModel extends Equatable {
  final String uid;
  final String nama;
  final String email;
  final String photoUrl;

  UserModel({this.uid, this.nama, this.email, this.photoUrl});

  @override
  List<Object> get props => [uid, nama, email, photoUrl];
}
