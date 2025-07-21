import 'package:book_rental_app/core/networks/api_factory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpApiService implements ApiFactory {
  @override
  FirebaseAuth? firebaseAuth;

  @override
  FirebaseFirestore? firestore;
  SignUpApiService() {
    firebaseAuth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
  }
}
