
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';

abstract class SingleCharacterState {}

class SingleCharacterInitial extends SingleCharacterState {}
class SingleCharacterLoading extends SingleCharacterState {}
class SingleCharacterLoaded extends SingleCharacterState {
  final CharacterEntity characterEntity;

  SingleCharacterLoaded(this.characterEntity);
}

class SingleCharacterError extends SingleCharacterState {
  final String message;

  SingleCharacterError(this.message);
}