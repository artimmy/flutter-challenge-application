import 'package:flutter_challenge_application/app/core/shared/services/http_service/i_http_service.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_challenge_application/app/features/pokemon/external/mappers/pokemon_mapper.dart';
import 'package:flutter_challenge_application/app/features/pokemon/infra/datasources/i_get_pokemon_datasource.dart';

class GetPokemonDatasource implements IGetPokemonDatasource {
  final IHttpService _httpService;

  const GetPokemonDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<PokemonEntity> call(String pokemonIdOrName) async {
    final response = await _httpService.get(
      'https://pokeapi.co/api/v2/pokemon/$pokemonIdOrName',
    );

    final data = response.data;

    final result = PokemonMapper.fromMap(data);

    return result;
  }
}
