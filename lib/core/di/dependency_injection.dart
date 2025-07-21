import 'package:book_rental_app/core/networks/api_factory.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/api/login_api_service.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/repo_implementation/repo_implemenation.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/login_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/repo/login_repo_domain.dart';
import 'package:book_rental_app/features/mobile/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/data/api/sign_up_api_service.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/data/repo_implementation/sign_up_repo_implementaion.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/repo/sign_up_repo_domain.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  //!! Features

  //Bloc
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => SignUpCubit(sl()));

  // Data Layer
  sl.registerLazySingleton<LoginApiService>(() => LoginApiService());
  sl.registerLazySingleton<SignUpApiService>(() => SignUpApiService());

  //Use Cases
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(loginRepoDomain: sl()),
  );
  sl.registerLazySingleton<SignUpUseCases>(
    () => SignUpUseCases(signUpRespo: sl()),
  );

  sl.registerLazySingleton<LoginRepoDomain>(
    () => RepoImplemenation(apiFactory: sl()),
  );
  sl.registerLazySingleton<SignUpRepoDomain>(
    () => SignUpRepoImplementaion(signUpService: sl()),
  );

  //!Core

  //!!Externat
}
