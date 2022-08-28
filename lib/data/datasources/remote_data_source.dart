import 'dart:convert';
import 'package:pokedex/data/exception.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import 'package:vexana/vexana.dart';

import '../constants.dart';

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getPokemons();
}

// for getting data from api
class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pms = List.filled(
        50,
        PokemonModel(
            abilities: List.filled(
                0,
                Ability(
                    ability: Species(name: "", url: ""),
                    isHidden: false,
                    slot: 0)),
            id: 0,
            height: 0,
            name: "",
            stats: List.filled(0,
                Stat(stat: Species(name: "", url: ""), baseStat: 0, effort: 0)),
            types:
                List.filled(0, Type(type: Species(name: "", url: ""), slot: 0)),
            weight: 0));

    int i = 0;

    for (String url in urls) {
      INetworkManager networkManager = NetworkManager(
          isEnableLogger: false, options: BaseOptions(baseUrl: url));

      final response = await networkManager.send<PokemonModel, PokemonModel>("",
          parseModel: PokemonModel(),
          method: RequestType.GET,
          isErrorDialog: true);

      if (response.data is PokemonModel) {
        pms[i] = response.data!;
        i++;
      } else {
        throw ServerException();
      }
    }

    //print("name: ${pms[49].name}");
    //print("weight: ${pms[49].weight}");
    //print("ability: ${pms[49].abilities![0].ability.name}");

    return pms;
  }
}
