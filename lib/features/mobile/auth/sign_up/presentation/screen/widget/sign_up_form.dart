import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:book_rental_app/core/widget/app_row_login.dart';
import 'package:book_rental_app/core/widget/app_text_form_field.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController controllerPasswrod;
  late TextEditingController controllerEmail;

  @override
  void initState() {
    controllerEmail = context.read<SignUpCubit>().controllerEmail;
    controllerPasswrod = context.read<SignUpCubit>().controllerPassword;
    super.initState();
  }

  // @override
  // void dispose() {
  //   controllerEmail.dispose();
  //   controllerPasswrod.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRowLogin(text: AppStrings.email),
          verticalSpace(5),
          AppTextFormField(
            // hintText: "",
            controller:
                //  context.read<SignUpCubit>().controllerEmail,
                controllerEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You did not enter userName";
              }
            },
          ),
          verticalSpace(23),
          AppRowLogin(text: AppStrings.password),
          verticalSpace(5),
          BlocBuilder<SignUpCubit, SignUpState>(
            //buildWhen: (previous, current) => current is LoginHidePasswordWord,
            builder: (context, state) {
              final isPasswrod =
                  (state is SignUpHidePasswordWord) ? state.isPassword : false;
              return AppTextFormField(
                obscureText: isPasswrod,
                controller:
                    //  context.read<SignUpCubit>().controllerPassword,
                    controllerPasswrod,
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<SignUpCubit>().hidePasswordWord();
                  },
                  child: Icon(
                    isPasswrod ? Icons.visibility_off : Icons.visibility,
                    size: 22.r,
                  ),
                ),
                hintText: "●●●●●●●●●●●●●●●●",
                hintStyle: TextStyles.font8DartGrayBold.copyWith(fontSize: 8),

                validator: (value) {
                  if (value?.isEmpty ?? value == null) {
                    return "You did not enter a password";
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
