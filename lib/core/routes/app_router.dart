import 'package:book_rental_app/core/di/dependency_injection.dart';
import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/features/mobile/auth/presentation/cubit/login_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/presentation/screen/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authLogin:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl<LoginCubit>(),
                child: LoginScreen(),
              ),
        );

      default:
        null;
    }
  }
}
