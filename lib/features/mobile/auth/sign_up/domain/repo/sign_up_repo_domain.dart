import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_request_body_entity.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_response_model_entity.dart';

abstract class SignUpRepoDomain {
  Future<ApiResulte<SignUpResponseModelEntity>> getSignUp(
    SignUpRequestBodyEntity signUpRequestBodyEntity,
  );
}
