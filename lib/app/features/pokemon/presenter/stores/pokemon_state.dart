import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonState {
  final PokemonEntity? pokemon;

  const PokemonState({
    required this.pokemon,
  });

  static PokemonState initState() {
    return const PokemonState(
      pokemon: null,
    );
  }

  PokemonState copyWith({
    PokemonEntity? pokemon,
  }) {
    return PokemonState(
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
