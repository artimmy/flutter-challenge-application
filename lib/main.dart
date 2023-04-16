import 'package:flutter/material.dart';
import 'package:flutter_challenge_application/app/app_module.dart';
import 'package:flutter_challenge_application/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

  // runApp(const MaterialApp(
  //   home: PokemonPage(),
  //   debugShowCheckedModeBanner: false,
  // ));