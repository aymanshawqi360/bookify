import 'package:book_rental_app/core/config/app_assest.dart';
import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/routes/routes.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:book_rental_app/core/widget/app_text_button.dart';
import 'package:book_rental_app/core/widget/app_text_have_an_account.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/cubit/cubit/sign_up_state.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/screen/widget/sign_up_bloc_listener.dart';
import 'package:book_rental_app/features/mobile/auth/sign_up/presentation/screen/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Container(
          // width: context.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [HexColor("FF2567E8"), HexColor("FF1CE6DA")],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssest.svgLogo,
                    height: 28.h,
                    width: 28.w,
                  ),

                  SizedBox(width: 10),
                  Text(
                    AppStrings.bookApp,
                    style: TextStyles.fon13LightGrayBold,
                  ),
                ],
              ),
              verticalSpace(50),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    //bottom: context.screenHeight / 12,
                  ),
                  child: Container(
                    // height: 350,
                    height: context.screenHeight / 2.4,
                    constraints: BoxConstraints(
                      // maxHeight: context.screenHeight / 1.8,
                      //  maxHeight: context.screenHeight / 1.9,
                    ),

                    decoration: BoxDecoration(
                      color: HexColor("FFFFFF"),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 24,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.signUp,
                              style: TextStyles.font32BlackSemiBold,
                            ),
                            SignUpForm(),
                            verticalSpace(15),
                            BlocBuilder<SignUpCubit, SignUpState>(
                              builder: (context, state) {
                                final cubit = (state is SignUpLoading);
                                return AppTextButton(
                                  width: context.screenWidth,
                                  text: "Log In",
                                  isLoading: cubit ? true : false,

                                  height: 50,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    _checkUserNameAndPasswrod(context);
                                  },
                                );
                              },
                            ),
                            verticalSpace(20),
                            AppTextHaveAnAccount(
                              isLoginOrSignUp: AppStrings.login,
                              // route: Routes.authLogin,
                              onTap: () {
                                context.pushNamedAndRemoveUntil(
                                  Routes.authLogin,
                                  predicate: (_) => false,
                                );
                              },
                              haveAccount: AppStrings.alreadyHaveAnAccount,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SignUpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  _checkUserNameAndPasswrod(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().getSignUp();
    }
  }
}
