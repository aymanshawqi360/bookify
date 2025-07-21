import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final double? horizontal;
  final double? vertical;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final Color? fillColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? obscureText;
  final Function(String?)? validator;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? autofocus;
  const AppTextFormField({
    super.key,
    this.horizontal,
    this.vertical,
    this.suffixIcon,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.obscureText,
    this.validator,
    this.cursorColor,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      controller: controller,

      style: TextStyle(color: ColorsManager.black),
      cursorColor: cursorColor ?? ColorsManager.black,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              // horizontal: context.screenWidth / 50,
              horizontal: 14,
              // vertical: context.screenHeight / 70,
              vertical: 12.5,
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: HexColor("EDF1F3"), width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: HexColor("EDF1F3"), width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        // UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 2),
        // ),
        suffixIcon: suffixIcon,

        isDense: true,
        filled: true,
        fillColor: fillColor ?? HexColor("FFFFFF"),
        hintText: hintText ?? "khaled.ibrahim@example.com",
        hintStyle: hintStyle ?? TextStyles.font10DartGrayBold,
      ),
      obscureText: obscureText ?? false,

      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
