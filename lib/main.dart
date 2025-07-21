import 'package:book_rental_app/book_rental_app.dart';
import 'package:book_rental_app/core/di/dependency_injection.dart';
import 'package:book_rental_app/core/routes/app_router.dart';
import 'package:book_rental_app/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(
    DevicePreview(
      backgroundColor: Colors.white,

      // enabled: !kReleaseMode,
      enabled: true,
      // tools: [...DevicePreview.defaultTools, CustomPaint()],
      builder: (context) => BookRentalApp(AppRouter()),
    ),
  );
}
