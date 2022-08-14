import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:auth_example/service/pokemon/pokemon.service.dart';
import 'package:get/get.dart';

class PokemonController extends GetxController {
  var pokemonsList = <Pokemon>[].obs;
  var isLoading = true.obs;
  var isNewLoading = false.obs;

  int _limit = 10;
  int get limit => _limit;
  set limit(int limit) {
    _limit = limit;
  }

  int _page = 1;
  int get page => _page;
  set page(int page) {
    _page = page;
  }

  // load more data everytime funcation is called;
  // First time load 10 elements
  // Next Time Load Next 10 and Append it into list
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {
      int offset = (page - 1) * limit;

      if (page == 1) {
        isLoading(true);
        var pokemons = await PokemonService.getPokemon(
          limit: limit,
        );
        pokemonsList.value = pokemons;
      } else {
        isNewLoading(true);
        var nextPokemon =
            await PokemonService.getPokemon(limit: limit, offset: offset);
        pokemonsList.addAll(nextPokemon);
      }

      page++;
    } finally {
      if (isLoading.value) isLoading(false);
      if (isNewLoading.value) isNewLoading(false);
    }
  }
}
