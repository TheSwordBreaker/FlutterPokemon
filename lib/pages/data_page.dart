import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:auth_example/service/pokemon/pokemon.service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:auth_example/common/app_card.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // late Future<List<Pokemon>> MyPokemon ;
  // @override
  // void initState() {
  //   super.initState();
  //   // MyPokemon =
  //   MyPokemon = PokemonService.getPokemon();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            // Image.asset('assets/pokeball.png', width: 30, height: 30),
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
                  // const Center(child: CircularProgressIndicator()),
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

                  FutureBuilder<List<Pokemon>>(
                    future: PokemonService.getPokemon(limit: 100),
                    builder: (context, snapshot) {
                      // print(snapshot);

                      if (snapshot.hasData) {
                        // return Text(snapshot.data![0].name ?? ' ');

                        return SizedBox(
                          height: 400,
                          child: GridView.builder(
                              // scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.9,
                                mainAxisSpacing: 16,
                              ),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: ((context, index) {
                                Pokemon pokemon = snapshot.data![index];

                                return AppCard(
                                  // child: SizedBox(
                                  // height: 200,

                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: pokemon.images,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                      ),
                                      Text(pokemon.name),
                                    ],
                                  ),
                                  // ),
                                );
                              })),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  )
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
                    Navigator.pushNamed(context, '/login');
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
