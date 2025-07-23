import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';
import 'package:book_rental_app/features/home/domain/repo/home_api_repo_domain.dart';

class HomeApiUseCases {
  final HomeApiRepoDomain _homeApiRepo;

  HomeApiUseCases(this._homeApiRepo);

  Future<ApiResulte<List<HomeApiResponseEntity>>> getListBooks() async {
    return await _homeApiRepo.listBooks();
  }
}
