import 'package:dartz/dartz.dart';
import 'package:lh_task/core/error/failure.dart';
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';
import 'package:lh_task/modules/character/domain/repositories/character_repository.dart';


class GetCharactersUseCase{
  final CharacterRepository characterRepository;
  GetCharactersUseCase(this.characterRepository);

  Future<Either<Failure,List<CharacterEntity>>> call(){
    return characterRepository.getCharacters();

  }
}