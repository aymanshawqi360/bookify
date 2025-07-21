import 'package:book_rental_app/core/errors/api_error_hundler.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/data/api/login_api_service.dart';
import 'package:book_rental_app/features/mobile/auth/data/mapper/login_mapper.dart';
import 'package:book_rental_app/features/mobile/auth/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/data/model/login_response_model.dart';
import 'package:book_rental_app/features/mobile/auth/domain/entity/login_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/domain/repo/login_repo_domain.dart';

class RepoImplemenation extends LoginRepoDomain {
  final LoginApiService apiFactory;

  RepoImplemenation({required this.apiFactory});

  @override
  Future<ApiResulte<LoginResponseModelEntity>> getLogin(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await apiFactory.firebaseAuth!
          .createUserWithEmailAndPassword(
            email: loginRequestModel.email!,
            password: loginRequestModel.password!,
          );
      //final dd =
      return ApiResulte.success(
        LoginMapper.getLoginResponseModelEntity(
          LoginResponseModel(
            token: response.user?.uid,
            email: response.user?.email,
          ),
        ),
      );
    } catch (e) {
      return ApiResulte.failure(ApiErrorHundler.handle(e));
    }
  }
}
