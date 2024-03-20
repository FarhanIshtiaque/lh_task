import 'package:dartz/dartz.dart';
import 'package:lh_task/core/error/failure.dart';
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';
import 'package:lh_task/modules/character/domain/repositories/character_repository.dart';


class GetCharacterUseCase{
  final CharacterRepository characterRepository;
  GetCharacterUseCase(this.characterRepository);

  Future<Either<Failure,CharacterEntity>> call(int id){
    return characterRepository.getCharacter(id);

  }
}