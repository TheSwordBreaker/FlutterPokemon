import 'dart:convert';

import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  static Future<List<Pokemon>> getPokemon(
      {int limit = 5, int offset = 0}) async {
    final uriBase = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=${limit}&offset=${offset}');

    // final uri = uriBase.replace(queryParameters: {'limit': limit});

    final res = await http.get(uriBase);
    // print(res.body);
    if (res.statusCode == 200) {
      // return Pokemon.fromJson(res.body);
      List<Map<String, dynamic>> data =
          List.from(json.decode(res.body)['results']);

      List<Pokemon> pokemons = data.asMap().entries.map<Pokemon>((e) {
        var myurl = e.value['url'].toString().split("/");
        String sid = myurl.elementAt(myurl.length - 2);

        int id = int.parse(sid);
        e.value['id'] = id;
        e.value['images'] =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$sid.png";

        return Pokemon.fromMap(e.value);
      }).toList();

      return pokemons;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
