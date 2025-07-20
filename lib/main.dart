import 'package:book_rental_app/book_rental_app.dart';
import 'package:book_rental_app/core/routes/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(BookRentalApp(AppRouter()));
  runApp(
    DevicePreview(
      backgroundColor: Colors.white,

      // enabled: !kReleaseMode,
      enabled: true,
      // tools: [...DevicePreview.defaultTools, CustomPaint()],
      builder: (context) => BookRentalApp(AppRouter()), // Wrap your app
    ),
  );
}

      
      
      // Wrap your app
    
  

