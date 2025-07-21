import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppTextHaveAnAccount extends StatelessWidget {
  final String isLoginOrSignUp;
  final String haveAccount;
  final void Function() onTap;

  const AppTextHaveAnAccount({
    super.key,
    required this.isLoginOrSignUp,

    required this.haveAccount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: haveAccount, style: TextStyles.fon12GrayMedium),
          WidgetSpan(child: horizontalSpace(6)),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: isLoginOrSignUp,
            style: TextStyles.fon12BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
