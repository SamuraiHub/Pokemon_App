import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../data/models/pokemon_model.dart';
import '../../translations/locale_keys.g.dart';

// pokemon features display
class AboutPokemon extends StatelessWidget {
  final PokemonModel pokemon;
  const AboutPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.Height.tr()),
            SizedBox(height: 20),
            Text(LocaleKeys.Weight.tr()),
            SizedBox(height: 20),
            Text(LocaleKeys.Ability.tr()),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (pokemon.height! / 10).toString() + ' cm',
              ),
              const SizedBox(height: 20),
              Text(
                (pokemon.weight! / 10).toString() + ' kg',
              ),
              const SizedBox(height: 20),
              Wrap(
                children: pokemon.abilities!
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: getBackGroundColor(
                            pokemon.types![0].type!.name!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          e.ability!.name!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
