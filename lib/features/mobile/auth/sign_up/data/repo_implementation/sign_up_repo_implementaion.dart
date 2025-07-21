import 'package:book_rental_app/core/errors/api_error_hundler.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/data/api/sign_up_api_service.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/data/mapper/sign_up_mapper.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_request_body_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/repo/sign_up_repo_domain.dart';

class SignUpRepoImplementaion extends SignUpRepoDomain {
  final SignUpApiService signUpService;

  SignUpRepoImplementaion({required this.signUpService});

  @override
  Future<ApiResulte<SignUpResponseModelEntity>> getSignUp(
    SignUpRequestBodyEntity signUpRequestBodyEntity,
  ) async {
    try {
      final response = await signUpService.firebaseAuth!
          .createUserWithEmailAndPassword(
            email: signUpRequestBodyEntity.email.toString(),
            password: signUpRequestBodyEntity.password.toString(),
          );

      if (response.user != null) {
        response.user!.sendEmailVerification();
      }

      return ApiResulte.success(
        SignUpMapper.getLoginResponseModelMapper(
          SignUpResponseModelEntity(
            email: response.user?.email,
            token: response.user?.uid,
          ),
        ),
      );
    } catch (e) {
      return ApiResulte.failure(ApiErrorHundler.handle(e));
    }
  }
}
