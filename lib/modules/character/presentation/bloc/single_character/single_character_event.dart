abstract class SingleCharacterEvent {}

class FetchSingleCharacter extends SingleCharacterEvent {
  final int id;

  FetchSingleCharacter({required this.id});
}