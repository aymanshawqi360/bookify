import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginApiService {
  FirebaseAuth? firebaseAuth;
  FirebaseFirestore? firestore;
  LoginApiService() {
    firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
    firestore = firestore ?? FirebaseFirestore.instance;
  }
}
