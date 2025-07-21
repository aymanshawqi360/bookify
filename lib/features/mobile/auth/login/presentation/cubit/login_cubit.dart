import 'package:bloc/bloc.dart';
import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/entity/login_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/login_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/login/presentation/cubit/login_state.dart';
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

    if (response is Success<LoginResponseModelEntity>) {
      emit(LoginSuccess(user: response.data!));
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

  @override
  Future<void> close() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    return super.close();
  }
}
