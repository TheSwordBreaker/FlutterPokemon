import 'dart:convert';

import 'package:auth_example/service/pokemonDetails/pokemonDetail.model.dart';
import 'package:http/http.dart' as http;

class PokemonDetailService {
  static Future<PokemonDetails> getPokemon(int id) async {
    final uriBase = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    final res = await http.get(uriBase);

    if (res.statusCode == 200) {
      return pokemonDetailsFromJson(res.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Pokemon');
    }
  }
}
