import 'package:flutter_challenge_application/app/features/pokemon/domain/usecases/get_pokemon/get_pokemon_usecase.dart';
import 'package:flutter_challenge_application/app/features/pokemon/presenter/pages/pokemon_page.dart';
import 'package:flutter_challenge_application/app/features/pokemon/presenter/stores/pokemon_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/datasources/get_pokemon_datasource.dart';
import 'infra/repositories/get_pokemon_repository.dart';

class PokemonModule extends Module {
  @override
  final List<Bind> binds = [
    // GetEmailByCpf
    Bind.factory((i) => GetPokemonUsecase(i())),
    Bind.factory((i) => GetPokemonRepository(i())),
    Bind.factory((i) => GetPokemonDatasource(httpService: i())),

    Bind.lazySingleton(
      (i) => PokemonStore(getPokemonUsecase: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, __) => const PokemonPage(),
    ),
  ];
}
