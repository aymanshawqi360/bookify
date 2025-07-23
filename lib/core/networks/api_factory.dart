import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  // DioFactory() {
  //   Duration time = const Duration(seconds: 30);
  //   if (dio == null) {
  //     dio = Dio();
  //     dio!
  //       ..options.receiveTimeout = time
  //       ..options.connectTimeout = time;
  //     getInterceptors();
  //     dio!;
  //   } else {
  //     dio!;
  //   }
  // }

  static dioInit() {
    Duration time = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.receiveTimeout = time
        ..options.connectTimeout = time;
      getInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void getInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
