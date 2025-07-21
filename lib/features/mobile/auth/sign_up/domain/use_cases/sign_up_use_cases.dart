import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_request_body_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_response_model_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/repo/sign_up_repo_domain.dart';

class SignUpUseCases {
  final SignUpRepoDomain signUpRespo;

  SignUpUseCases({required this.signUpRespo});

  Future<ApiResulte<SignUpResponseModelEntity>> getSignUp(
    SignUpRequestBodyEntity signUpRequestBodyEntity,
  ) {
    return signUpRespo.getSignUp(signUpRequestBodyEntity);
  }
}
