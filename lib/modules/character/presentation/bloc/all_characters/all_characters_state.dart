import 'package:lh_task/modules/character/domain/entities/character_entity.dart';

abstract class AllCharactersState {}

class AllCharactersInitial extends AllCharactersState {}
class AllCharactersLoading extends AllCharactersState {}
class AllCharactersLoaded extends AllCharactersState {
  final List<CharacterEntity> characters;

  AllCharactersLoaded(this.characters);
}

class AllCharactersError extends AllCharactersState {
  final String message;

  AllCharactersError(this.message);
}