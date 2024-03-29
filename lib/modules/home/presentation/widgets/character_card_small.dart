

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/text_styles.dart';

class CharacterCardSmall extends StatelessWidget {
  const CharacterCardSmall({
    super.key, required this.name, required this.image, this.onTap,
  });

  final String name;
  final String image;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 136.h,
        width: 135.h,
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
                  height: 99.h,
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
        // color: AppColors.primary,
      ),
    );
  }
}