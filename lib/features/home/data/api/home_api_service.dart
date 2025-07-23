import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/features/home/data/api/api_constants.dart';
import 'package:book_rental_app/features/home/data/model/home_api_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(ApiConstants.listBooks)
  Future<HomeApiResponseModel> listBooks();
}
