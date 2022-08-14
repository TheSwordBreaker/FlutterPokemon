import 'package:auth_example/common/my_base_card.dart';
import 'package:auth_example/pages/pokemon_page.dart';
import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonGridCard extends StatelessWidget {
  const PokemonGridCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/signup');
        Get.to(
          () => PokemonPage(pokemon: pokemon),
          transition: Transition.fadeIn,
        );
      },
      child: MyBaseCard(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: pokemon.id,
                child: CachedNetworkImage(
                  imageUrl: pokemon.images,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Text(pokemon.name),
          ],
        ),
        // ),
      ),
    );
  }
}
