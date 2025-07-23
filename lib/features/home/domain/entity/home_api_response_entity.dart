import 'package:equatable/equatable.dart';

class HomeApiResponseEntity extends Equatable {
  final String? author;
  final String? country;
  final String? description;
  final int? id;
  final String? imageUrl;
  final String? title;
  final double? rating;
  final int? year;

  const HomeApiResponseEntity({
    required this.author,
    required this.country,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.year,
  });

  @override
  List<Object?> get props => [
    author,
    country,
    description,
    id,
    imageUrl,
    title,
    rating,
    year,
  ];
}
