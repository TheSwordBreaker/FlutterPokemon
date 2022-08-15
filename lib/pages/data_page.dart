import 'package:auth_example/common/app_card.dart';
import 'package:auth_example/common/pokemon_grid_card.dart';
import 'package:auth_example/controller/auth.controller.dart';
import 'package:auth_example/service/pokemon/pokemon.controller.dart';
import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:google_fonts/google_fonts.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Text(
              "Pokédex",
              style: GoogleFonts.righteous(
                textStyle: Theme.of(context).textTheme.headline5,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_sharp),
            tooltip: 'Search Icon',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Favorite Icon',
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppCard(
              child: Column(
                children: <Widget>[
                  const Text(
                    "We Have Pokemons",
                    style: TextStyle(fontSize: 32.0),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Image.network(
                        'https://play.pokemonshowdown.com/sprites/gen5/charizard-megay.png',
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, size: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Search'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Explore Your Type",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DynamicPokemonGrid()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You had Enought Right "),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    AuthController.instance.logout();
                    // Get.toNamed('/login');
                  },
                  child: const Text("Logout"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DynamicPokemonGrid extends StatefulWidget {
  const DynamicPokemonGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<DynamicPokemonGrid> createState() => _DynamicPokemonGridState();
}

class _DynamicPokemonGridState extends State<DynamicPokemonGrid> {
  final PokemonController pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Obx(
        () {
          if (pokemonController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return LazyLoadScrollView(
              onEndOfPage: () {
                pokemonController.loadData();
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 16,
                ),
                shrinkWrap: true,
                itemCount: pokemonController.pokemonsList.length,
                itemBuilder: ((context, index) {
                  Pokemon pokemon = pokemonController.pokemonsList[index];

                  return PokemonGridCard(pokemon: pokemon);
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
