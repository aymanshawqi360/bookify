import 'package:book_rental_app/features/home/data/model/home_api_response_model.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';

class HomeApiMapper {
  static HomeApiResponseEntity getListBooks(Books homeApiResponseModel) {
    return HomeApiResponseEntity(
      author: homeApiResponseModel.author ?? "defaultAuthor",
      country: homeApiResponseModel.country ?? "defaultCountry",
      description: homeApiResponseModel.description ?? "defaultDescription",
      id: homeApiResponseModel.id ?? 0,
      imageUrl: homeApiResponseModel.imageUrl ?? "defaultImageUrl",
      title: homeApiResponseModel.title ?? "defaulTtitle",
      rating: homeApiResponseModel.rating ?? 4.8,
      year: homeApiResponseModel.year ?? 1988,
    );
  }
}
