import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final String? text;
  final void Function()? onTap;
  final TextStyle? textStyles;
  final BorderRadiusGeometry? borderRadius;
  const AppTextButton({
    this.width,
    this.height,
    this.decoration,
    this.text,
    this.onTap,
    this.textStyles,
    super.key,
    this.borderRadius,
  });

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
          child: Text(
            text ?? "LogIn",
            style: textStyles ?? TextStyles.fon14WhiteMedium,
          ),
        ),
      ),
    );
  }
}
