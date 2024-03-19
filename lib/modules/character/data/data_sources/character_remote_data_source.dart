import 'package:lh_task/modules/character/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {

  Future<CharacterModel> getCharacter(int id);

}