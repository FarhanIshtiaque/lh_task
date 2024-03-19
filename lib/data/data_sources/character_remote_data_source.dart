import 'package:lh_task/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {

  Future<CharacterModel> getCharacter(int id);

}