import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:pokedex/presentation/pokemons/pokemons_list.dart';
import '../../controller/pokemon_controller.dart';
import '../../data/models/pokemon_model.dart';
import '../../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// displays 50 pokemons on screen after geeting them from api
class PokemonScreen extends StatelessWidget {
  var pokeController = Get.put(PokemonController());
  var scrollController = Get.put(ScrollController());
  var textEditingController = TextEditingController();
  List<PokemonModel> pokemonList = Get.put(<PokemonModel>[]);

  @override
  Widget build(BuildContext context) {
    if (pokeController.isLoading.value) {
      pokeController.getFirst50Pokemons();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          LocaleKeys.appTitle.tr(),
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                if (pokemonList.isNotEmpty) {
                  pokeController.pokemonList.value = pokemonList;
                  //pokeController.pokemonList.refresh();
                }
              },
              child: Text(
                "Reset".tr(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
      body: Obx(() => pokeController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: <Widget>[
              Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Search".tr(),
                        prefixIcon: Icon(Icons.search)),
                    onChanged: (newText) {
                      if (newText == "")
                        pokeController.pokemonList.value = pokemonList;
                      else {
                        List<PokemonModel> seachPokemons = <PokemonModel>[];
                        for (int i = 0; i < 50; i++) {
                          if (pokemonList[i].name!.startsWith(newText)) {
                            {
                              seachPokemons.add(pokemonList[i]);
                            }
                          }
                        }
                        if (seachPokemons.isNotEmpty) {
                          pokeController.pokemonList.value = seachPokemons;
                          //pokeController.pokemonList.refresh();
                          //print(newText);
                        }
                      }
                    },
                    onSubmitted: (newText) {
                      if (newText == "")
                        pokeController.pokemonList.value = pokemonList;
                      else {
                        List<PokemonModel> seachPokemons = <PokemonModel>[];
                        for (int i = 0; i < 50; i++) {
                          if (pokemonList[i].name!.startsWith(newText)) {
                            seachPokemons.add(pokemonList[i]);
                          }
                        }
                        if (seachPokemons.isNotEmpty) {
                          pokeController.pokemonList.value = seachPokemons;
                          //pokeController.pokemonList.refresh();
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: PokemonList(
                  pokemonList: pokeController.pokemonList.value,
                  scrollController: scrollController,
                ),
              )
            ])),
    );
  }
}
