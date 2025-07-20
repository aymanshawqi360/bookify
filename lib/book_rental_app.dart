import 'package:book_rental_app/core/routes/app_router.dart';
import 'package:book_rental_app/core/themes/color_manager.dart';
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
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: _appRouter.generateRoute,
        );
      },
    );
  }
}
