import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/constants/app_assets.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/app_values.dart';
import 'package:lh_task/core/constants/text_styles.dart';
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';
import 'package:lh_task/modules/character/presentation/pages/cast_details.dart';
import 'package:lh_task/modules/character/presentation/widgets/character_card_big.dart';

class AllCast extends StatelessWidget {
  const AllCast({super.key, required this.characters});

  final List<CharacterEntity> characters;

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppValues.horizontalPadding),
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
                    itemCount: characters.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .8,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        return CharacterCardBig(onTap:(){
                          final character = characters[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CastDetails(character:character),
                            ),
                          );
                        }, name: characters[index].name, image:  characters[index].imageUrl,);
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


