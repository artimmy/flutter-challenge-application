// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../controllers/pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  final PokemonController pokemonController;
  const PokemonPage({
    Key? key,
    required this.pokemonController,
  }) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  // Future<void> searchPokemon() async {
  //   // Store??
  //   String name = textController.text.toLowerCase();
  //   String url = 'https://pokeapi.co/api/v2/pokemon/$name';

  //   // Usecase / Datasource
  //   _http.Response response;
  //   response = await _http.get(Uri.parse(url));

  //   // Left
  //   if (response.statusCode == 404) {
  //     // MELHORIA 404 PRA CIMA É ERRO NESSE CASO PODERIA FICAR ASSIM  response.statusCode <= 404
  //     setState(() {
  //       pokemon = 'POKEMON NÃO ENCONTRADO';
  //       pokemonPicture =
  //           'https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png';
  //     });
  //     return;
  //   }

  //   Map<String, dynamic> result = json.decode(response.body);

  //   // Mapper
  //   String pokemonName = result['name'];
  //   String pokemonAbility = result['abilities'][0]['ability']['name'];
  //   String pokemonPic =
  //       result['sprites']['other']['official-artwork']['front_default'];

  //   // Store
  //   setState(() {
  //     pokemon = 'Nome: $pokemonName  /  Habilidade: $pokemonAbility';
  //     pokemonPicture = pokemonPic;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // int generateRandomColor() {
    //   Random random = Random();
    //   return Color.fromARGB(
    //     255,
    //     random.nextInt(256),
    //     random.nextInt(256),
    //     random.nextInt(256),
    //   ).value;
    // }

    // final color = const Color.fromRGBO(246, 238, 189, 1).value;

    // // final int? color = const Color.fromRGBO(255, 125, 1, 1).value;
    // print(color);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pokemon APP'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  widget.pokemonController.hintPicture,
                ),
                Text(
                  widget.pokemonController.hintName,
                ),
                TextField(
                  autofocus: true,
                  controller: widget.pokemonController.pokemonTextController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await widget.pokemonController.searchPokemon();
                  },
                  child: const Text('Procurar'),
                ),
                // Container(
                //   width: 90,
                //   height: 90,
                //   color: Color(generateRandomColor()),
                // ),
                // // selecionar texto
                // const SelectableText(
                //   'The stars twinkled in the midnight sky,\n As the wind whispered a lullaby.',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
