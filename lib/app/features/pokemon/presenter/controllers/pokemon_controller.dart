import 'package:flutter/material.dart';
import 'package:flutter_challenge_application/app/features/pokemon/presenter/stores/pokemon_store.dart';

import '../../domain/entities/pokemon_entity.dart';

class PokemonController {
  final PokemonStore pokemonStore;
  PokemonController({
    required this.pokemonStore,
  });

  TextEditingController pokemonTextController = TextEditingController();

  String hintText = 'digite o nome do pokemon e clique em procurar';
  String hintPicture =
      'https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png';

  PokemonEntity? get pokemonEntity => pokemonStore.state.pokemon;
  String get hintPic => pokemonEntity?.picture ?? hintPicture;
  String get hintName => pokemonEntity?.name ?? hintText;

  Future<void> searchPokemon() async {
    pokemonStore.getPokemon(pokemonTextController.text);
  }
}
