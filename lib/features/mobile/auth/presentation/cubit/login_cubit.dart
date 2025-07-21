import 'package:bloc/bloc.dart';
import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/domain/entity/login_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/domain/login_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;
  LoginCubit(this.loginUseCases) : super(LoginInitial());
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  void getLogin() async {
    emit(LoginLoading());
    final response = await loginUseCases.getLogin(
      LoginRequestModel(
        email: controllerEmail.text,
        password: controllerPassword.text,
      ),
    );

    debugPrint(controllerEmail.text);
    debugPrint(controllerPassword.text);

    if (response is Success<LoginResponseModelEntity>) {
      emit(LoginSuccess());
    } else if (response is Failure<LoginResponseModelEntity>) {
      emit(
        LoginFailure(
          errorMesssage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage!,
          ),
        ),
      );
    }
  }

  void hidePasswordWord() {
    isPassword = !isPassword;
    emit(LoginHidePasswordWord(isPassword: isPassword));
  }
}
