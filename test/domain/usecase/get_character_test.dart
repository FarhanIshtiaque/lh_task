import 'package:dartz/dartz.dart';
import 'package:lh_task/domain/entities/character_entity.dart';
import 'package:lh_task/domain/usecases/get_character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetCharacterUseCase getCharacterUseCase;
  late MockCharacterRepository mockCharacterRepository;
  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharacterUseCase = GetCharacterUseCase(mockCharacterRepository);
  });

  const testCharacterEntity = CharacterEntity(
      imageUrl: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
      status: "Alive",
      species: "Human",
      gender: "Male",
      origin: 'Earth',
      lastKnownLocation: "Dhaka",
      id: 1,
      name: 'Morty');
  const testId = 1 ;

  test('Should get single character details by id form repository', () async{
    // arrange
    when(
        mockCharacterRepository.getCharacter(testId)
    ).thenAnswer((_)async => const Right(testCharacterEntity) );

    
    // act
   final result = await getCharacterUseCase.execute(testId);
    // assert

    expect(result,const Right(testCharacterEntity));

  });

}
