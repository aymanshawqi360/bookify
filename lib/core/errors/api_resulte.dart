import 'package:book_rental_app/core/errors/api_error_model.dart';

abstract class ApiResulte<T> {
  const ApiResulte();
  factory ApiResulte.success(T data) = Success<T>;
  factory ApiResulte.failure(ApiErrorModel data) = Failure<T>;
}

class Success<T> extends ApiResulte<T> {
  final T? data;

  Success(this.data);
}

class Failure<T> extends ApiResulte<T> {
  final ApiErrorModel apiErrorModel;

  Failure(this.apiErrorModel);
}
