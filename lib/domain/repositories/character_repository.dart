import 'package:dartz/dartz.dart';
import 'package:lh_task/core/error/failure.dart';
import 'package:lh_task/domain/entities/character_entity.dart';

abstract class CharacterRepository{
  Future<Either<Failure,CharacterEntity>> getCharacter(int id);
}