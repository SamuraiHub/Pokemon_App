import 'package:get/get.dart';

import '../data/datasources/remote_data_source.dart';
import '../data/models/pokemon_model.dart';
import '../data/repository/pokemon_repository_impl.dart';

// for getting pokemons (1-50)
class PokemonController extends GetxController {
  var isLoading = true.obs;
  List<PokemonModel> pokemonList = <PokemonModel>[].obs;

  ///Method used to get all pokemons from 1-50
  Future<void> getFirst50Pokemons() async {
    try {
      isLoading.value = true;

      var result =
          await PokemonRepositoryImpl(remoteDataSource: RemoteDataSourceImpl())
              .getPokemons();

      result.fold(
        (exception) {
          print(exception.message);
        },
        (pokemons) {
          pokemonList = pokemons;
        },
      );

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        borderRadius: 5.0,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
