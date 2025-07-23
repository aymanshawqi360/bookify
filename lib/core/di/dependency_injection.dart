import 'package:book_rental_app/core/networks/api_factory.dart';
import 'package:book_rental_app/features/home/data/api/home_api_service.dart';
import 'package:book_rental_app/features/home/data/repo_implementaion/home_repo_implementation.dart';
import 'package:book_rental_app/features/home/domain/repo/home_api_repo_domain.dart';
import 'package:book_rental_app/features/home/domain/use_cases/home_api_use_cases.dart';
import 'package:book_rental_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/login/data/repo_implementation/repo_implemenation.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/login_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/login/domain/repo/login_repo_domain.dart';
import 'package:book_rental_app/features/mobile/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/data/repo_implementation/sign_up_repo_implementaion.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/repo/sign_up_repo_domain.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  //!Core
  Dio dio = DioFactory.dioInit();
  // sl.registerLazySingleton<DioFactory>(() => DioFactory.dioInit());

  //!! Features
  //Bloc
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => HomeCubit(sl()));

  // Data Layer
  // sl.registerLazySingleton<LoginApiService>(() => LoginApiService());
  // sl.registerLazySingleton<SignUpApiService>(() => SignUpApiService());
  sl.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  //Use Cases
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(loginRepoDomain: sl()),
  );
  sl.registerLazySingleton<SignUpUseCases>(
    () => SignUpUseCases(signUpRespo: sl()),
  );
  sl.registerLazySingleton<HomeApiUseCases>(() => HomeApiUseCases(sl()));

  sl.registerLazySingleton<LoginRepoDomain>(
    () => RepoImplemenation(apiFactory: sl()),
  );
  sl.registerLazySingleton<SignUpRepoDomain>(
    () => SignUpRepoImplementaion(signUpService: sl()),
  );
  sl.registerLazySingleton<HomeApiRepoDomain>(
    () => HomeRepoImplementation(sl()),
  );

  //!!Externat
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
