import 'package:json_annotation/json_annotation.dart';

part 'home_api_response_model.g.dart';

@JsonSerializable()
class HomeApiResponseModel {
  @JsonKey(name: "books")
  List<Books>? listBooks;

  HomeApiResponseModel({required this.listBooks});

  factory HomeApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeApiResponseModelFromJson(json);
}

@JsonSerializable()
class Books {
  final String? author;
  final String? country;
  final String? description;
  final int? id;
  final String? imageUrl;
  final String? title;
  final double? rating;
  final int? year;

  Books({
    required this.author,
    required this.country,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.year,
  });

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);
}
