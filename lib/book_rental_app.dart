import 'package:book_rental_app/core/di/dependency_injection.dart' show sl;
import 'package:book_rental_app/core/networks/api_factory.dart';
import 'package:book_rental_app/core/routes/app_router.dart';
import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

class BookRentalApp extends StatelessWidget {
  final AppRouter _appRouter;
  const BookRentalApp(this._appRouter, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(scaffoldBackgroundColor: ColorsManager.white),
          // darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute:
              (FirebaseAuth.instance.currentUser != null &&
                      FirebaseAuth.instance.currentUser!.emailVerified)
                  ? Routes.homeScreen
                  : Routes.authLogin,
          onGenerateRoute: _appRouter.generateRoute,
        );
      },
    );
  }
}
