import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/features/mobile/auth/presentation/screen/login_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        null;
    }
  }
}
