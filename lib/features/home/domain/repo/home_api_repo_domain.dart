import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';

abstract class HomeApiRepoDomain {
  Future<ApiResulte<List<HomeApiResponseEntity>>> listBooks();
}
