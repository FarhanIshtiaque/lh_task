import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lh_task/core/constants/app_assets.dart';
import 'package:lh_task/core/constants/app_colors.dart';
import 'package:lh_task/injection_container.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_event.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_state.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SingleCharacterBloc>()..add(FetchSingleCharacter(id: 2)),
      child: Scaffold(
        backgroundColor: AppColors.primary,

        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            SvgPicture.asset(
              AppAssets.bgShape,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.rickMorty,

              ),
            ),
            // Column(
            //   children: [
            //     const Text('Characters',
            //       style: TextStyle(color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     BlocBuilder<SingleCharacterBloc, SingleCharacterState>(
            //
            //       builder: (context, state) {
            //         if (state is SingleCharacterLoading) {
            //           return const CircularProgressIndicator();
            //         } else if (state is SingleCharacterLoaded) {
            //           return Text(state.characterEntity.name);
            //         } else if (state is SingleCharacterError) {
            //           return Text(state.message);
            //         }
            //         return Container();
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
