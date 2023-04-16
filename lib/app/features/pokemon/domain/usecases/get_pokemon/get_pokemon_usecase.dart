import 'package:flutter_challenge_application/app/core/shared/failures/i_app_exception.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/repositories/i_get_pokemon_repository.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/usecases/get_pokemon/i_get_pokemon_usecase.dart';
import 'package:fpdart/fpdart.dart';

class GetPokemonUsecase implements IGetPokemonUsecase {
  final IGetPokemonRepository _repository;

  const GetPokemonUsecase(this._repository);

  @override
  Future<Either<IAppException, PokemonEntity>> call({
    required String pokemonIdOrName,
  }) {
    return _repository.call(pokemonIdOrName);
  }
}
