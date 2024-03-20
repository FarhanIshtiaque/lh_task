import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String lastKnownLocation;

  const CharacterEntity(
      {required this.imageUrl,
      required this.status,
      required this.species,
      required this.gender,
      required this.origin,
      required this.lastKnownLocation,
      required this.id,
      required this.name});

  @override
  List<Object?> get props =>
      [id, name, imageUrl, status, species, gender, origin, lastKnownLocation];
}
