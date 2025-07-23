import 'package:book_rental_app/core/config/app_assest.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/hex_colors.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAndNameAndNotification extends StatelessWidget {
  const ImageAndNameAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(maxRadius: 25, minRadius: 25),
            horizontalSpace(4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  style: TextStyles.fon12DavysDraySemiRegular,
                ),
                Text("Ayman", style: TextStyles.fon16DarkGraySemiRegular),
              ],
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor("B9C1D9"), width: 1),
          ),
          child: SvgPicture.asset(
            AppAssest.svgNotification,

            // fit: BoxFit.fill,
            // width: context.screenWidth / 25,
            // height: context.screenHeight / 25,
          ),
        ),
      ],
    );
  }
}
