import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class HomeShimmerLoading extends StatelessWidget {
  final int index;
  const HomeShimmerLoading({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? context.screenWidth / 90 : context.screenWidth / 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.screenHeight / 5.0,
            width: context.screenWidth / 3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          verticalSpace(3),
          Text(
            "Things Dall Apart",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "start7.0",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(milliseconds: 800), //default
        ),
      ),
    );
  }
}
