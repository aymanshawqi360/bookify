import 'package:book_rental_app/features/mobile/auth/data/api/login_api_service.dart';
import 'package:book_rental_app/features/mobile/auth/data/repo_implementation/repo_implemenation.dart';
import 'package:book_rental_app/features/mobile/auth/domain/login_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/domain/repo/login_repo_domain.dart';
import 'package:book_rental_app/features/mobile/auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  //!! Features

  //Bloc
  sl.registerFactory(() => LoginCubit(sl()));

  // Data Layer
  sl.registerLazySingleton<LoginApiService>(() => LoginApiService());

  //Use Cases
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(loginRepoDomain: sl()),
  );

  sl.registerLazySingleton<LoginRepoDomain>(
    () => RepoImplemenation(apiFactory: sl()),
  );

  //!Core

  //!!Externat
}
