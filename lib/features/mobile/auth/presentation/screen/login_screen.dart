import 'package:book_rental_app/core/config/app_assest.dart';
import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:book_rental_app/core/widget/app_row_login.dart';
import 'package:book_rental_app/core/widget/app_text_button.dart';
import 'package:book_rental_app/core/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [HexColor("FF2567E8"), HexColor("FF1CE6DA")],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

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
                  // horizontalSpace(10),
                  SizedBox(width: 10),
                  Text(
                    AppStrings.bookApp,
                    style: TextStyles.fon13LightGrayBold,
                  ),
                ],
              ),
              verticalSpace(50),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      //bottom: context.screenHeight / 12,
                    ),
                    child: Container(
                      // height: 500.h,
                      constraints: BoxConstraints(
                        maxHeight: context.screenHeight / 1.8,
                      ),

                      width: context.screenWidth,
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
                        child: Column(
                          children: [
                            Text(
                              AppStrings.login,
                              style: TextStyles.font32BlackSemiBold,
                            ),

                            verticalSpace(24),
                            AppRowLogin(text: AppStrings.email),
                            verticalSpace(10),
                            AppTextFormField(),
                            verticalSpace(20),
                            AppRowLogin(text: AppStrings.password),
                            verticalSpace(10),
                            AppTextFormField(
                              hintText: "●●●●●●●●●●●●●●●●",
                              hintStyle: TextStyles.font8DartGrayBold,
                              obscureText: true,
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                size: 20,
                                color: ColorsManager.gray,
                              ),
                            ),
                            verticalSpace(15),
                            AppTextButton(
                              width: context.screenWidth,
                              // height: context.screenHeight / 15,
                              height: 50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  Padding(
//                     padding: EdgeInsets.only(
//                       top: 24.h,
//                       left: 16.w,
//                       right: 16.w,
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           AppStrings.login,
//                           style: TextStyles.fon32BlackSemiBold,
//                         ),
//                         verticalSpace(24),
//                         AppRowLogin(text: AppStrings.email),
//                         verticalSpace(10),
//                         AppTextFormField(),
//                         verticalSpace(20),
//                         AppRowLogin(text: AppStrings.password),
//                         verticalSpace(10),
//                         AppTextFormField(
//                           hintText: "●●●●●●●●●●●●●●●●",
//                           obscureText: true,
//                           suffixIcon: Icon(Icons.remove_red_eye, size: 24),
//                         ),
//                         // verticalSpace(20),
//                         AppTextButton(
//                           width: context.screenWidth,
//                           // height: context.screenHeight / 15,
//                           height: 50,
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),