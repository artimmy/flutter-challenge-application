import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonMapper {
  const PokemonMapper._();

  static PokemonEntity fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      name: map['name'],
      picture: map['sprites']['other']['official-artwork']['front_default'],
      ability: map['abilities']['ability']['name'],
    );
  }
}
