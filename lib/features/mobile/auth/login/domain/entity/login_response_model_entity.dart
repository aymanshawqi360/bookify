import 'package:firebase_auth/firebase_auth.dart';

class LoginResponseModelEntity {
  final UserCredential? user;
  LoginResponseModelEntity({this.user});
}
