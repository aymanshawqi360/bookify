import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFailure extends SignUpState {
  final ApiErrorModel errorMessage;

  const SignUpFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class SignUpHidePasswordWord extends SignUpState {
  final bool isPassword;

  const SignUpHidePasswordWord({required this.isPassword});
  @override
  List<Object> get props => [isPassword];
}
