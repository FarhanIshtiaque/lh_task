import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lh_task/core/constants/app_assets.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/app_values.dart';
import 'package:lh_task/core/constants/text_styles.dart';
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';

class CastDetails extends StatelessWidget {
  const CastDetails({super.key, required this.character});

  final CharacterEntity character ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: false,
      appBar: AppBar(

        backgroundColor: AppColors.white.withOpacity(.05),
        elevation: 2,
        centerTitle: true,
        title: Image.asset(
          AppAssets.logo, // Path to your PNG logo image
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.appBg,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppValues.horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    character.name,
                    style: body1Strong.copyWith(color: AppColors.secondary),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 240.h,
                    width: 240.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(.2))),
                    //  width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl:
                          character.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.primary.withOpacity(.3))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppAssets.heartIcon),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Status',
                                  style:
                                      tittle4.copyWith(color: AppColors.white),
                                ),
                                Text(
                                  character.status,
                                  style: body1.copyWith(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.primary.withOpacity(.3))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppAssets.androidIcon),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Species',
                                  style:
                                      tittle4.copyWith(color: AppColors.white),
                                ),
                                Text(
                                  character.species,
                                  style: body1.copyWith(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.primary.withOpacity(.3))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppAssets.genderIcon),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Gender',
                                  style: tittle4.copyWith(color: AppColors.white),
                                ),
                                Text(
                                  character.gender,
                                  style: body1.copyWith(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(.3))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppAssets.androidIcon),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Origin',
                                style:
                                tittle4.copyWith(color: AppColors.white),
                              ),
                              Text(
                                character.origin,
                                style: body1.copyWith(color: AppColors.white),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.ios_share_rounded,
                            color: AppColors.white,
                          )
                        ],
                      ),
                    ),
                  ),
              const SizedBox(height: 16,),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(.3))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppAssets.locationIcon),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Last known Location',
                                style:
                                tittle4.copyWith(color: AppColors.white),
                              ),
                              Text(
                                character.lastKnownLocation,
                                style: body1.copyWith(color: AppColors.white),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.ios_share_rounded,
                            color: AppColors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
