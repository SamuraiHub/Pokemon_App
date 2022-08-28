import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:pokedex/presentation/pokemons/pokemons_list.dart';
import '../../controller/pokemon_controller.dart';
import '../../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// displays 50 pokemons on screen after geeting them from api
class PokemonScreen extends StatelessWidget {
  var pokeController = Get.put(PokemonController());
  var scrollController = Get.put(ScrollController());

  @override
  Widget build(BuildContext context) {
    if (pokeController.isLoading.value) pokeController.getFirst50Pokemons();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          LocaleKeys.appTitle.tr(),
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: Obx(() => pokeController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PokemonList(
              pokemonList: pokeController.pokemonList,
              scrollController: scrollController,
            )),
    );
  }
}
