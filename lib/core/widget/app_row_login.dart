import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class AppRowLogin extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const AppRowLogin({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(text, style: textStyle ?? TextStyles.font12GrayMedium)],
    );
  }
}
