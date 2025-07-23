import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/widget/app_lsit_view.dart';
import 'package:book_rental_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_rental_app/features/home/presentation/cubit/home_state.dart';
import 'package:book_rental_app/features/home/presentation/widget/home_book_item.dart';
import 'package:book_rental_app/features/home/presentation/widget/home_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocListener extends StatelessWidget {
  const HomeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is HomeLoading ||
              current is HomeSuccess ||
              current is HomeFailure,
      builder: (context, state) {
        switch (state) {
          case HomeLoading():
            return _buildLoadingState(context);

          case HomeSuccess():
            return _buildSuccessState(state, context);
          case HomeFailure():
            return _buildFailureState(state);
          default:
            return Text("Error");
        }
      },
    );
  }

  _buildLoadingState(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 3.8,
      child: AppListView(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return HomeShimmerLoading(index: index);
          // HomeBookItem(index: index);
        },
      ),
    );
  }

  _buildSuccessState(HomeSuccess state, BuildContext context) {
    return Flexible(
      child: SizedBox(
        //  constraints: BoxConstraints(maxHeight: context.screenHeight / 4.0),
        height: context.screenHeight / 3.8,
        child: AppListView(
          scrollDirection: Axis.horizontal,
          itemCount: state.listBooks.length,
          itemBuilder: (context, index) {
            return HomeBookItem(
              index: index,
              homeApiResponseEntity: state.listBooks[index],
            );
          },
        ),
      ),
    );
  }

  _buildFailureState(HomeFailure state) {
    return Center(child: Text(state.errorMessage.errorMessage.toString()));
  }
}
