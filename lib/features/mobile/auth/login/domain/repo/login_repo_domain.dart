import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/model/login_request_model.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/entity/login_response_model_entity.dart';

abstract class LoginRepoDomain {
  Future<ApiResulte<LoginResponseModelEntity>> getLogin(
    LoginRequestModel loginRequestModel,
  );
}
