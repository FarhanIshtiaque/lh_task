import 'package:lh_task/modules/character/domain/repositories/character_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;


@GenerateMocks(

  [CharacterRepository],
  customMocks: [MockSpec<http.Client>(as : #MockHttpClient)]
)


void main(){}