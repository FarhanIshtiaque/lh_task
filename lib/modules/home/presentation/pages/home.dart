import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/constants/app_assets.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/core/constants/app_values.dart';
import 'package:lh_task/core/constants/text_styles.dart';
import 'package:lh_task/injection_container.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_event.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_state.dart';
import 'package:lh_task/modules/character/presentation/pages/all_cast.dart';
import 'package:lh_task/modules/character/presentation/pages/cast_details.dart';
import 'package:lh_task/modules/home/presentation/widgets/character_card_small.dart';
import 'package:lh_task/modules/home/presentation/widgets/small_button.dart';
import 'package:lh_task/modules/splash/splash.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<AllCharactersBloc>()
        ..add(FetchAllCharacters()),
      child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
        builder: (context, state) {

          if(state is AllCharactersLoading){
            return const Splash();
          } else if(state is AllCharactersLoaded){
            return Scaffold(
              backgroundColor: AppColors.black,
              extendBodyBehindAppBar: true,
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
                    padding: const EdgeInsets.all(AppValues.horizontalPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 120.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Favourite',
                              style: body1Strong.copyWith(color: AppColors.white),
                            ),
                            SmallButton(onPressed: () {})
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 137.h,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const CharacterCardSmall(
                                  image:
                                  "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                  name: 'Not finished',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 15,
                                );
                              },
                              itemCount: 5),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Meet the cast',
                              style: body1Strong.copyWith(color: AppColors.white),
                            ),
                            SmallButton(onPressed: () {
                              final characters =state.characters;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllCast(characters:characters),
                                ),
                              );
                            })
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 137.h,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCardSmall(
                                  onTap: (){
                                    final character =state.characters[index];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CastDetails(character:character),
                                      ),
                                    );
                                  },
                                  image:
                                  state.characters[index].imageUrl,
                                  name: state.characters[index].name,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 15,
                                );
                              },
                              itemCount: 5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if(state is AllCharactersError){
            return Text(state.message);
          }


          return Container();
        },
      ),
    );
  }
}
