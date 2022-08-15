import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:auth_example/service/pokemonDetails/pokemonDetail.controller.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../common/app_card.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDetailController ctrl =
        Get.put(PokemonDetailController(pokemon.id));
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
                  Hero(
                    tag: pokemon.id,
                    child: SizedBox(
                      height: 300,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.images,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "We Have ${pokemon.name}",
                    style: const TextStyle(fontSize: 32.0),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  Obx(() {
                    var myDetailPokemon = ctrl.poke.value;
                    var statsList = myDetailPokemon.stats;
                    if (ctrl.isLoading.isTrue) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyListData("Height:", "${myDetailPokemon.height}"),
                        MyListData("Weight:", "${myDetailPokemon.weight}"),
                        MyListData("Base Experience:",
                            "${myDetailPokemon.baseExperience}"),
                        MyListData("Type:",
                            myDetailPokemon.types?.join(', ') ?? 'N/A'),
                        MyListData("Abilities:",
                            myDetailPokemon.abilities?.join(', ') ?? 'N/A'),

                        const Divider(),

                        const Text(
                          "Stats ",
                          style: TextStyle(fontSize: 28.0),
                        ),
                        ...statsList!.map((e) => MyListData(
                            e.name.toLowerCase(), e.baseStat.toString()))

                        // MyListData("k" ,
                        //     myDetailPokemon.abilities?.join(', ') ?? 'N/A'),
                      ],
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyListData extends StatelessWidget {
  const MyListData(this.first, this.last, {Key? key}) : super(key: key);

  final String first;
  final String last;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(first),
      trailing: Text(last),
    );
  }
}
