import 'package:dartz/dartz.dart';
import 'package:lh_task/core/error/failure.dart';
import 'package:lh_task/core/helper/logger.dart';
import 'package:lh_task/modules/character/data/data_sources/character_remote_data_source.dart';
import 'package:lh_task/modules/character/data/models/character_model.dart';
import 'package:lh_task/modules/character/domain/entities/character_entity.dart';
import 'package:lh_task/modules/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository{
  final CharacterRemoteDataSource characterRemoteDataSource;
  CharacterRepositoryImpl({required this.characterRemoteDataSource});



  @override
  Future<Either<Failure, CharacterEntity>> getCharacter(int id) async{
   try{
     final result = await characterRemoteDataSource.getCharacter(id);
     return Right(result.toEntity());

   } catch(e){
     return const Left(ServerFailure('An error has occurred'));
   }

  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async{
    // TODO: implement getCharacters
    try{
      final  List<CharacterModel> characterModels  = await characterRemoteDataSource.getCharacters();
      final List<CharacterEntity> characters = characterModels.map(( character) => character.toEntity()).toList();
      return Right(characters);

    } catch(e){
      return const Left(ServerFailure('An error has occurred'));
    }
  }

}