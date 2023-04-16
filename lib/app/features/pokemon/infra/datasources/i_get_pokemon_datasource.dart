import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class IGetPokemonDatasource {
  Future<PokemonEntity> call(String pokemonIdOrName);
}
