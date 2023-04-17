import 'package:flutter_challenge_application/app/features/pokemon/pokemon_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: PokemonModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
