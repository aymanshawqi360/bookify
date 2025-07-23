// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final List<HomeApiResponseEntity> listBooks;
  const HomeSuccess({required this.listBooks});
  @override
  List<Object> get props => [];
}

class HomeFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
