import 'package:book_rental_app/core/errors/api_error_hundler.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/home/data/api/home_api_service.dart';
import 'package:book_rental_app/features/home/data/mapper/home_api_mapper.dart';

import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';
import 'package:book_rental_app/features/home/domain/repo/home_api_repo_domain.dart';

class HomeRepoImplementation extends HomeApiRepoDomain {
  final HomeApiService _homeApiService;

  HomeRepoImplementation(this._homeApiService);

  @override
  Future<ApiResulte<List<HomeApiResponseEntity>>> listBooks() async {
    try {
      final response = await _homeApiService.listBooks();
      List<HomeApiResponseEntity>? _listBooksEntity =
          response.listBooks
              ?.map((value) => HomeApiMapper.getListBooks(value))
              .toList();
      return ApiResulte.success(_listBooksEntity ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHundler.apiHundle(e));
    }
  }
}
