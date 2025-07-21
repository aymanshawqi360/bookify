import 'package:book_rental_app/features/mobile/auth/data/model/login_response_model.dart';
import 'package:book_rental_app/features/mobile/auth/domain/entity/login_response_model_entity.dart';

class LoginMapper {
  static LoginResponseModelEntity getLoginResponseModelEntity(
    LoginResponseModel responseModel,
  ) {
    return LoginResponseModelEntity(
      token: responseModel.token ?? "defaultToken",
      email: responseModel.email ?? "defaultEmail",
    );
  }
}
