import 'package:flutter_challenge_application/app/core/shared/failures/i_app_exception.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IGetPokemonUsecase {
  Future<Either<IAppException, PokemonEntity>> call({
    required String pokemonIdOrName,
  });
}
