abstract class SingleCharacterEvent {}

class FetchSingleCharacter extends SingleCharacterEvent {
  final int id;

  FetchSingleCharacter(this.id);
}