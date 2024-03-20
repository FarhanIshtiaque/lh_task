import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/text_styles.dart';

class CharacterCardBig extends StatelessWidget {
  const CharacterCardBig({
    super.key, required this.name, required this.image,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
              color: AppColors.primary.withOpacity(.2))),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: SizedBox(
                height: 150.h,
                width: double.maxFinite,
                child: CachedNetworkImage(
                  imageUrl:
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              name,
              style:
              tittle4.copyWith(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}