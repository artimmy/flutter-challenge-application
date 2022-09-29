import 'package:flutter/material.dart';
import 'package:http/http.dart' as _http;
import 'dart:convert';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  TextEditingController textController = TextEditingController();
  String pokemon = 'digite o nome do pokemon e clique em procurar';
  String pokemonPicture =
      'https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png';

  Future<void> searchPokemon() async {
    // Store??
    String name = textController.text.toLowerCase();
    String url = 'https://pokeapi.co/api/v2/pokemon/$name';

    // Usecase / Datasource
    _http.Response response;
    response = await _http.get(Uri.parse(url));

    // Left
    if (response.statusCode == 404) {
      debugPrint(response.statusCode.toString().toUpperCase());
      setState(() {
        pokemon = 'POKEMON NÃO ENCONTRADO';
        pokemonPicture =
            'https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png';
      });
      return;
    }

    Map<String, dynamic> result = json.decode(response.body);

    // Mapper
    String pokemonName = result['name'];
    String pokemonAbility = result['abilities'][0]['ability']['name'];
    String pokemonPic =
        result['sprites']['other']['official-artwork']['front_default'];

    // Store
    setState(() {
      pokemon = 'Nome: $pokemonName  /  Abilidade: $pokemonAbility';
      pokemonPicture = pokemonPic;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Image.network(pokemonPicture),
                Text(pokemon.toUpperCase()),
                TextField(
                  autofocus: true,
                  controller: textController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await searchPokemon();
                  },
                  child: const Text('Procurar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
