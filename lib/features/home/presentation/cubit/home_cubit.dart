import 'package:bloc/bloc.dart';
import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:book_rental_app/core/errors/api_resulte.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';
import 'package:book_rental_app/features/home/domain/use_cases/home_api_use_cases.dart';
import 'package:book_rental_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/widgets.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeApiUseCases _homeApiUseCases;
  HomeCubit(this._homeApiUseCases) : super(HomeInitial());

  void getListBooks() async {
    emit(HomeLoading());

    final resposne = await _homeApiUseCases.getListBooks();

    if (resposne is Success<List<HomeApiResponseEntity>>) {
      debugPrint("Success==================================");
      emit(HomeSuccess(listBooks: resposne.data ?? []));
    } else if (resposne is Failure<List<HomeApiResponseEntity>>) {
      emit(
        HomeFailure(
          errorMessage: ApiErrorModel(
            errorMessage:
                resposne.apiErrorModel.errorMessage ?? "Unknown error occurred",
          ),
        ),
      );
    }
  }
}
