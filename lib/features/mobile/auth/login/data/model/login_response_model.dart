import 'package:firebase_auth/firebase_auth.dart';

class LoginResponseModel {
  final String? token;
  final String? email;
  final User? user;
  LoginResponseModel({
    required this.token,
    required this.email,
    required this.user,
  });
}
