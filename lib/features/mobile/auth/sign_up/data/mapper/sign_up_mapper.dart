import 'package:book_rental_app/features/mobile/auth/sign_up/domain/entity/sign_up_response_model_entity.dart';

class SignUpMapper {
  static SignUpResponseModelEntity getLoginResponseModelMapper(
    SignUpResponseModelEntity responseModel,
  ) {
    return SignUpResponseModelEntity(
      token: responseModel.token ?? "defaultToken",
      email: responseModel.email ?? "defaultEmail",
    );
  }
}
