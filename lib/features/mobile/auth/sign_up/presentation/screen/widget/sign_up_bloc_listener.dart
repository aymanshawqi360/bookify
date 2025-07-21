import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is SignUpSuccess ||
              current is SignUpFailure ||
              current is SignUpLoading,
      listener: (context, state) {
        if (state is SignUpLoading) {
          // _setupLoadingSate(context);
        } else if (state is SignUpSuccess) {
          // context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.authLogin,
            predicate: (_) => false,
          );
        } else if (state is SignUpFailure) {
          // context.pop();
          _setupErrorState(context, state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _setupErrorState(BuildContext context, SignUpFailure state) {
    //context.pop();
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          //icon: const Icon(Icons.error, color: Colors.red, size: 32),
          title: Text(
            "Error",
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.w800,
            ),
          ),

          content: Text(
            state.errorMessage.errorMessage.toString(),
            //style: TextStyles.font14DarkTaupeRegular,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Text(
                "Cancel",
                // style: TextStyle(color: ColorsMananger.darkGray),
              ),
            ),
          ],
        );
      },
    );
  }
}
