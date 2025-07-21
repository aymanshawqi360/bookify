import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/features/mobile/auth/login/presentation/cubit/login_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginSuccess ||
              current is LoginFailure ||
              current is LoginLoading,
      listener: (context, state) {
        if (state is LoginLoading) {
          // _setupLoadingSate(context);
        } else if (state is LoginSuccess) {
          if (state.user.user!.user!.emailVerified == true) {
            context.pushNamedAndRemoveUntil(
              Routes.authSignUp,
              predicate: (_) => false,
            );
          } else {
            _setupErrorState(
              context,
              error:
                  "A verification link has been sent to your email. Please check it to activate your account.",
            );
          }
          // context.pop();
          // context.pushNamedAndRemoveUntil(
          //   Routes.buttonNavigateBetweenScreen,
          //   predicate: (_) => false,
          // );
        } else if (state is LoginFailure) {
          // context.pop();
          _setupErrorState(
            context,
            error: state.errorMesssage.errorMessage.toString(),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _setupErrorState(
    BuildContext context, {
    // LoginFailure? state,
    String? error,
  }) {
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
            error.toString(),
            // state == null
            //     ? (error!)
            //     : (state.errorMesssage.errorMessage.toString()),
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
