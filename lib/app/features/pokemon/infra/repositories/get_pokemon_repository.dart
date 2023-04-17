import 'package:flutter_challenge_application/app/core/shared/failures/i_app_exception.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/repositories/i_get_pokemon_repository.dart';
import 'package:flutter_challenge_application/app/features/pokemon/infra/datasources/i_get_pokemon_datasource.dart';
import 'package:fpdart/fpdart.dart';

class GetPokemonRepository implements IGetPokemonRepository {
  final IGetPokemonDatasource _datasource;

  const GetPokemonRepository(this._datasource);

  @override
  Future<Either<IAppException, PokemonEntity>> call(
    String pokemonIdOrName,
  ) async {
    try {
      final response = await _datasource(pokemonIdOrName);

      return Right(response);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
