import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lh_task/modules/character/domain/usecases/get_character.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_event.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_state.dart';



class SingleCharacterBloc extends Bloc<SingleCharacterEvent, SingleCharacterState>{
  final GetCharacterUseCase getCharacterUseCase;

  SingleCharacterBloc({required this.getCharacterUseCase}) : super( SingleCharacterInitial()) {
    on<FetchSingleCharacter>((event, emit) async {
      emit(SingleCharacterLoading());
      final failureOrCharacter = await getCharacterUseCase(event.id);
      failureOrCharacter.fold(
              (failure) => emit(SingleCharacterError(failure.toString())),
              (character) => emit(SingleCharacterLoaded(character)));
    });
  }
}