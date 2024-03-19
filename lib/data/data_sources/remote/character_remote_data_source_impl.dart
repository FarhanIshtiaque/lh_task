import 'dart:convert';
import 'package:lh_task/core/constants/api_endpoints.dart';
import 'package:lh_task/core/error/server_exception.dart';
import 'package:lh_task/data/data_sources/character_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:lh_task/data/models/character_model.dart';


class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource{

  final http.Client client;
  CharacterRemoteDataSourceImpl(this.client);

  @override
  Future<CharacterModel> getCharacter(int id) async{
    // TODO: implement getCharacter
    String query = '''
    query {
      character(id: 2) {
        id
        name
        status
        species
        type
        gender
        origin {
          name
          type
          dimension
        }
        location {
          name
          type
          dimension
        }
        image
      }
    }
  ''';
    // Request body
    Map<String, String> body = {'query': query};

    final response =
        await client.post(Uri.parse(ApiEndPoints.baseUrl),
            body: json.encode(body)
        );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return CharacterModel.fromJson(responseBody['data']['character']);
    } else {
      throw ServerException();
    }
  }
  
}