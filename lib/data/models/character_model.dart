import 'package:lh_task/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.status,
    required super.species,
    required super.gender,
    required super.origin,
    required super.lastKnownLocation,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        origin: json['origin']['name'],
        lastKnownLocation: json['location']['name'],
      );

  CharacterEntity toEntity() => CharacterEntity(
      imageUrl: imageUrl,
      status: status,
      species: species,
      gender: gender,
      origin: origin,
      lastKnownLocation: lastKnownLocation,
      id: id,
      name: name);
}
