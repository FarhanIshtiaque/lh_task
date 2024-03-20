import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lh_task/injection_container.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_event.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_state.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<AllCharactersBloc>()
        ..add(FetchAllCharacters()),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BlocBuilder<AllCharactersBloc, AllCharactersState>(
              builder: (context, state) {
                if (state is AllCharactersLoading) {
                  return const CircularProgressIndicator();
                } else if (state is AllCharactersLoaded) {
                  return ListView.builder(itemBuilder: (context, index) {
                    return Text(state.characters[index].name);
                  },
                    shrinkWrap: true,
                    itemCount:state.characters.length,
                  );
                } else if (state is AllCharactersError) {
                  return Text(state.message);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}


