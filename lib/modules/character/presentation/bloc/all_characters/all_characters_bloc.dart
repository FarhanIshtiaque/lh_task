import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lh_task/modules/character/domain/usecases/get_characters.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_event.dart';
import 'package:lh_task/modules/character/presentation/bloc/all_characters/all_characters_state.dart';



class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState>{
  final GetCharactersUseCase getCharactersUseCase;

  AllCharactersBloc({required this.getCharactersUseCase}) : super( AllCharactersInitial()) {
    on<FetchAllCharacters>((event, emit) async {
      emit(AllCharactersLoading());
      final failureOrCharacters = await getCharactersUseCase();
      failureOrCharacters.fold(
              (failure) => emit(AllCharactersError(failure.toString())),
              (characters) => emit(AllCharactersLoaded(characters)));
    });
  }
}