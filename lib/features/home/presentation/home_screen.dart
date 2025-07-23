import 'package:book_rental_app/core/config/app_assest.dart';
import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/themes/styles.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:book_rental_app/core/widget/app_lsit_view.dart';
import 'package:book_rental_app/core/widget/app_text_form_field.dart';
import 'package:book_rental_app/features/home/presentation/widget/home_bloc_listener.dart';
import 'package:book_rental_app/features/home/presentation/widget/image_and_name_and_notifcation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth / 30,
                right: context.screenWidth / 30,
                top: context.screenHeight / 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageAndNameAndNotification(),
                  verticalSpace(24),
                  AppTextFormField(
                    hintText: "Search",
                    //  fillColor: HexColor("131316"),
                    hintStyle: TextStyles.fon15DavysDraySemiRegular,
                    prefixIcon: Transform.scale(
                      scaleX: 0.7,
                      scaleY: 0.7,
                      child: SvgPicture.asset(AppAssest.search),
                    ),
                    // contentPadding: EdgeInsets.only(),
                    //  fillColor: HexColor("131316"),
                  ),
                  verticalSpace(24),
                  Text(
                    AppStrings.suggestionsForYou,
                    style: TextStyles.fon18DarkGraySemiRegular,
                  ),
                ],
              ),
            ),
            verticalSpace(24),
            const HomeBlocListener(),
            Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth / 30,
                right: context.screenWidth / 30,
                top: context.screenHeight / 50,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.theBestTours,
                    style: TextStyles.fon18DarkGraySemiRegular,
                  ),
                ],
              ),
            ),
            // verticalSpace(16),
            Container(
              constraints: BoxConstraints(maxHeight: context.screenHeight / 12),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: context.screenWidth / 90,
                  right: context.screenWidth / 90,
                ),
                shrinkWrap: true,
                primary: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      start:
                          index == 0
                              ? context.screenWidth / 90
                              : context.screenWidth / 45,
                    ),
                    child: Container(
                      //   height: context.screenHeight / 12,
                      width: context.screenWidth / 3,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpace(30),
            Container(
              constraints: BoxConstraints(maxHeight: context.screenHeight / 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      start:
                          index == 0
                              ? context.screenWidth / 90
                              : context.screenWidth / 45,
                    ),
                    child: Container(
                      width: context.screenWidth / 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
