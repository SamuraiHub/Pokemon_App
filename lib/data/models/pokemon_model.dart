import 'package:vexana/vexana.dart';

// model class representation of a pokemon
class PokemonModel extends INetworkModel<PokemonModel> {
  List<Ability>? abilities;
  int? id;
  int? height;
  String? name;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  PokemonModel(
      {this.abilities,
      this.id,
      this.height,
      this.name,
      this.stats,
      this.types,
      this.weight});

  String get imageUrl {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }

  factory PokemonModel.fromJson(Map<String, dynamic> map) {
    return PokemonModel(
      abilities:
          List<Ability>.from(map["abilities"].map((x) => Ability.fromJson(x))),
      id: map['id'],
      height: map['height'],
      name: map['name'],
      stats: List<Stat>.from(map['stats'].map((x) => Stat.fromJson(x))),
      types: List<Type>.from(map['types'].map((x) => Type.fromJson(x))),
      weight: map['weight'],
    );
  }

  @override
  PokemonModel fromJson(Map<String, dynamic> json) {
    return PokemonModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability!.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
