import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:auth_example/service/pokemonDetails/pokemonDetail.model.dart';
import 'package:auth_example/service/pokemonDetails/pokemonDetail.service.dart';

class PokemonDetailController extends GetxController {
  final poke = PokemonDetails.empty().obs;
  final int id;
  var isLoading = true.obs;

  PokemonDetailController(this.id);

  @override
  void onInit() {
    loadData(id);
    super.onInit();
  }

  void loadData(int id) async {
    try {
      isLoading(true);
      var pokemons = await PokemonDetailService.getPokemon(id);
      poke.value = pokemons;
    } catch (e) {
      // if (kDebugMode) {
      print(e);
      // }
    } finally {
      if (isLoading.value) isLoading(false);
    }
  }
}
