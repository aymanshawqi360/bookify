import 'package:book_rental_app/features/mobile/auth/login/domain/entity/login_response_model_entity.dart';

class LoginMapper {
  static LoginResponseModelEntity getLoginResponseModelEntity(
    LoginResponseModelEntity responseModel,
  ) {
    return LoginResponseModelEntity(
      user: responseModel.user,
      // token: responseModel.token ?? "defaultToken",
      // email: responseModel.email ?? "defaultEmail",
    );
  }
}
