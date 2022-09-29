import 'package:flutter_challenge_application/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonMapper extends PokemonEntity {
  const PokemonMapper({
    required String name,
    required String picture,
    required String ability,
  }) : super(
          name: name,
          picture: picture,
          ability: ability,
        );

  factory PokemonMapper.fromMap(Map<String, dynamic> map) {
    return PokemonMapper(
      name: map['name'],
      picture: map['sprites']['other']['official-artwork']['front_default'],
      ability: map['abilities']['ability']['name'],
    );
  }
}
