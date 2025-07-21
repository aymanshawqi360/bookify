// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final String? text;
  final void Function()? onTap;
  final TextStyle? textStyles;
  final BorderRadiusGeometry? borderRadius;
  final bool? isLoading;
  const AppTextButton({
    Key? key,
    this.width,
    this.height,
    this.decoration,
    this.text,
    this.onTap,
    this.textStyles,
    this.borderRadius,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? context.screenWidth / 3,

        height: height ?? context.screenHeight / 20,

        decoration:
            decoration ??
            BoxDecoration(
              color: HexColor("1D61E7"),
              borderRadius: borderRadius ?? BorderRadius.circular(19.r),
            ),
        child: Center(
          child:
              (isLoading == true)
                  ? Transform.scale(
                    scale: 0.6,

                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: ColorsManager.white,
                    ),
                  )
                  : Text(
                    text ?? "LogIn",
                    style: textStyles ?? TextStyles.fon14WhiteMedium,
                  ),
        ),
      ),
    );
  }
}
