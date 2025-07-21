import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/domain/entity/login_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/domain/repo/login_repo_domain.dart';

class LoginUseCases {
  final LoginRepoDomain loginRepoDomain;

  LoginUseCases({required this.loginRepoDomain});

  Future<ApiResulte<LoginResponseModelEntity>> getLogin(
    LoginRequestModel loginRequestModel,
  ) async {
    return await loginRepoDomain.getLogin(loginRequestModel);
  }
}
