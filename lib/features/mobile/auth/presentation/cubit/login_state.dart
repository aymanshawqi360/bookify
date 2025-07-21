import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginFailure extends LoginState {
  final ApiErrorModel errorMesssage;

  const LoginFailure({required this.errorMesssage});
  @override
  List<Object> get props => [errorMesssage];
}

final class LoginHidePasswordWord extends LoginState {
  final bool isPassword;

  const LoginHidePasswordWord({required this.isPassword});
  @override
  List<Object> get props => [isPassword];
}
