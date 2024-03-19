import 'package:dartz/dartz.dart';
import 'package:lh_task/core/error/failure.dart';
import 'package:lh_task/data/data_sources/character_remote_data_source.dart';
import 'package:lh_task/domain/entities/character_entity.dart';
import 'package:lh_task/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository{
  final CharacterRemoteDataSource characterRemoteDataSource;
  CharacterRepositoryImpl(this.characterRemoteDataSource);



  @override
  Future<Either<Failure, CharacterEntity>> getCharacter(int id) async{
   try{
     final result = await characterRemoteDataSource.getCharacter(id);
     return Right(result.toEntity());

   } catch(e){
     return const Left(ServerFailure('An error has occurred'));
   }

  }

}