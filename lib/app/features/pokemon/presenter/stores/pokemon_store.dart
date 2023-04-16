// ignore_for_file: avoid_print

import 'package:flutter_challenge_application/app/core/shared/failures/i_app_exception.dart';
import 'package:flutter_challenge_application/app/features/pokemon/domain/usecases/get_pokemon/i_get_pokemon_usecase.dart';
import 'package:flutter_challenge_application/app/features/pokemon/presenter/stores/pokemon_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PokemonStore extends NotifierStore<IAppException, PokemonState> {
  final IGetPokemonUsecase _getPokemonUsecase;
  PokemonStore({
    required IGetPokemonUsecase getPokemonUsecase,
  })  : _getPokemonUsecase = getPokemonUsecase,
        super(PokemonState.initState());

  Future<void> getPokemon(String pokemonIdOrName) async {
    setLoading(true);
    final result = await _getPokemonUsecase.call(
      pokemonIdOrName: pokemonIdOrName,
    );
    result.fold(
      (l) {
        print(l.message);
        setError(l);
      },
      (r) => update(state.copyWith(pokemon: r)),
    );
    setLoading(false);
  }
}
