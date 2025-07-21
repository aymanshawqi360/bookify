import 'package:bloc/bloc.dart';
import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_request_body_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCases signUpUseCases;
  SignUpCubit(this.signUpUseCases) : super(SignUpInitial());

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  void getSignUp() async {
    emit(SignUpLoading());
    final response = await signUpUseCases.getSignUp(
      SignUpRequestBodyEntity(
        email: controllerEmail.text,
        password: controllerPassword.text,
      ),
    );

    if (response is Success<SignUpResponseModelEntity>) {
      emit(SignUpSuccess());
    } else if (response is Failure<SignUpResponseModelEntity>) {
      emit(
        SignUpFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage!,
          ),
        ),
      );
    }
  }

  void hidePasswordWord() {
    isPassword = !isPassword;
    emit(SignUpHidePasswordWord(isPassword: isPassword));
  }

  @override
  Future<void> close() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    return super.close();
  }
}
