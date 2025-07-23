import 'package:book_rental_app/core/errors/api_error_hundler.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/mapper/login_mapper.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/entity/login_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/repo/login_repo_domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepoImplemenation extends LoginRepoDomain {
  // final LoginApiService apiFactory;
  final FirebaseAuth apiFactory;

  RepoImplemenation({required this.apiFactory});

  @override
  Future<ApiResulte<LoginResponseModelEntity>> getLogin(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await apiFactory.signInWithEmailAndPassword(
        email: loginRequestModel.email.toString(),
        password: loginRequestModel.password.toString(),
      );

      return ApiResulte.success(
        LoginMapper.getLoginResponseModelEntity(
          LoginResponseModelEntity(user: response),
        ),
      );
    } catch (e) {
      return ApiResulte.failure(ApiErrorHundler.handle(e));
    }
  }
}
