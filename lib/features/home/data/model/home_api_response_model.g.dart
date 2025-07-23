// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeApiResponseModel _$HomeApiResponseModelFromJson(
  Map<String, dynamic> json,
) => HomeApiResponseModel(
  listBooks:
      (json['books'] as List<dynamic>?)
          ?.map((e) => Books.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeApiResponseModelToJson(
  HomeApiResponseModel instance,
) => <String, dynamic>{'books': instance.listBooks};

Books _$BooksFromJson(Map<String, dynamic> json) => Books(
  author: json['author'] as String?,
  country: json['country'] as String?,
  description: json['description'] as String?,
  id: (json['id'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  title: json['title'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  year: (json['year'] as num?)?.toInt(),
);

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
  'author': instance.author,
  'country': instance.country,
  'description': instance.description,
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'title': instance.title,
  'rating': instance.rating,
  'year': instance.year,
};
