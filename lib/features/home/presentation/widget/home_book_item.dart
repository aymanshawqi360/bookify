import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:book_rental_app/core/utils/extensions.dart';
import 'package:book_rental_app/core/utils/spacing.dart';
import 'package:book_rental_app/features/home/domain/entity/home_api_response_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBookItem extends StatelessWidget {
  final int index;
  final HomeApiResponseEntity? homeApiResponseEntity;
  const HomeBookItem({
    super.key,
    required this.index,
    this.homeApiResponseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? context.screenWidth / 90 : context.screenWidth / 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: homeApiResponseEntity!.imageUrl.toString(),
              width: context.screenWidth / 3,
              height: context.screenHeight / 5.0,
              fit: BoxFit.fill,

              errorWidget: (context, url, error) {
                return Icon(Icons.error, color: Colors.red);
              },
              placeholder: (context, url) {
                return Container(
                  height: context.screenHeight / 5.0,
                  width: context.screenWidth / 3,
                  decoration: BoxDecoration(
                    color: ColorsManager.gray.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
          ),
          verticalSpace(3),
          Container(
            constraints: BoxConstraints(maxWidth: context.screenWidth / 3),
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "${homeApiResponseEntity!.title}",
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.amberAccent,
                size: 20,
              ),
              Text(
                homeApiResponseEntity!.rating.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
