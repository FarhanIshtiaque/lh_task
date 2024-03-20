import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/app_values.dart';
import 'package:lh_task/core/constants/text_styles.dart';
import 'package:lh_task/modules/character/presentation/widgets/character_card_big.dart';

import '../../../../core/constants/app_assets.dart';

class AllCast extends StatelessWidget {
  const AllCast({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.symmetric(horizontal:AppValues.horizontalPadding),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'All Cast',
                    style: body1Strong.copyWith(color: AppColors.secondary),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .8,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        return CharacterCardBig(name: 'Rick', image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg",);
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


