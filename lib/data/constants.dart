import 'dart:ui';

class Constants {
  static Color creamColor = const Color(0xfff5f5f5);
}

const List<String> urls = [
  "https://pokeapi.co/api/v2/pokemon/1/",
  "https://pokeapi.co/api/v2/pokemon/2/",
  "https://pokeapi.co/api/v2/pokemon/3/",
  "https://pokeapi.co/api/v2/pokemon/4/",
  "https://pokeapi.co/api/v2/pokemon/5/",
  "https://pokeapi.co/api/v2/pokemon/6/",
  "https://pokeapi.co/api/v2/pokemon/7/",
  "https://pokeapi.co/api/v2/pokemon/8/",
  "https://pokeapi.co/api/v2/pokemon/9/",
  "https://pokeapi.co/api/v2/pokemon/10/",
  "https://pokeapi.co/api/v2/pokemon/11/",
  "https://pokeapi.co/api/v2/pokemon/12/",
  "https://pokeapi.co/api/v2/pokemon/13/",
  "https://pokeapi.co/api/v2/pokemon/14/",
  "https://pokeapi.co/api/v2/pokemon/15/",
  "https://pokeapi.co/api/v2/pokemon/16/",
  "https://pokeapi.co/api/v2/pokemon/17/",
  "https://pokeapi.co/api/v2/pokemon/18/",
  "https://pokeapi.co/api/v2/pokemon/19/",
  "https://pokeapi.co/api/v2/pokemon/20/",
  "https://pokeapi.co/api/v2/pokemon/21/",
  "https://pokeapi.co/api/v2/pokemon/22/",
  "https://pokeapi.co/api/v2/pokemon/23/",
  "https://pokeapi.co/api/v2/pokemon/24/",
  "https://pokeapi.co/api/v2/pokemon/25/",
  "https://pokeapi.co/api/v2/pokemon/26/",
  "https://pokeapi.co/api/v2/pokemon/27/",
  "https://pokeapi.co/api/v2/pokemon/28/",
  "https://pokeapi.co/api/v2/pokemon/29/",
  "https://pokeapi.co/api/v2/pokemon/30/",
  "https://pokeapi.co/api/v2/pokemon/31/",
  "https://pokeapi.co/api/v2/pokemon/32/",
  "https://pokeapi.co/api/v2/pokemon/33/",
  "https://pokeapi.co/api/v2/pokemon/34/",
  "https://pokeapi.co/api/v2/pokemon/35/",
  "https://pokeapi.co/api/v2/pokemon/36/",
  "https://pokeapi.co/api/v2/pokemon/37/",
  "https://pokeapi.co/api/v2/pokemon/38/",
  "https://pokeapi.co/api/v2/pokemon/39/",
  "https://pokeapi.co/api/v2/pokemon/40/",
  "https://pokeapi.co/api/v2/pokemon/41/",
  "https://pokeapi.co/api/v2/pokemon/42/",
  "https://pokeapi.co/api/v2/pokemon/43/",
  "https://pokeapi.co/api/v2/pokemon/44/",
  "https://pokeapi.co/api/v2/pokemon/45/",
  "https://pokeapi.co/api/v2/pokemon/46/",
  "https://pokeapi.co/api/v2/pokemon/47/",
  "https://pokeapi.co/api/v2/pokemon/48/",
  "https://pokeapi.co/api/v2/pokemon/49/",
  "https://pokeapi.co/api/v2/pokemon/50/"
];

const Map<String, Color> pokemonTypeMap = {
  "grass": Color(0xFF78C850),
  "poison": Color(0xFF98558e),
  "fire": Color(0xFFFB6C6C),
  "flying": Color(0xFFA890F0),
  "bug": Color(0xFF48D0B0),
  "water": Color(0xFF7AC7FF),
  "normal": Color(0xFFbcbcad),
  "ground": Color(0xFFeece5a),
  "fairy": Color(0xFFf9acff),
  "electric": Color(0xFFfee53c),
  "fighting": Color(0xFFa75544),
  "psychic": Color(0xFFf160aa),
  "rock": Color(0xFFcebd74),
  "steel": Color(0xFFc4c2db),
  "ice": Color(0xFF96f1ff),
  "ghost": Color(0xFF7C538C),
  "dragon": Color(0xD07038F8),
  "dark": Color(0xFF8f6955),
};

const Map<String, Color> pokemonTypeMap2 = {
  "grass": Color.fromARGB(255, 180, 233, 156),
  "poison": Color.fromARGB(255, 218, 129, 203),
  "fire": Color.fromARGB(255, 248, 135, 135),
  "flying": Color.fromARGB(255, 164, 136, 247),
  "bug": Color.fromARGB(255, 89, 245, 208),
  "water": Color.fromARGB(255, 162, 214, 252),
  "normal": Color.fromARGB(255, 236, 236, 147),
  "ground": Color.fromARGB(255, 245, 227, 162),
  "fairy": Color.fromARGB(255, 243, 143, 250),
  "electric": Color.fromARGB(255, 248, 241, 197),
  "fighting": Color.fromARGB(255, 250, 113, 85),
  "psychic": Color.fromARGB(255, 240, 153, 198),
  "rock": Color.fromARGB(255, 236, 198, 29),
  "steel": Color.fromARGB(255, 140, 133, 241),
  "ice": Color.fromARGB(255, 101, 224, 243),
  "ghost": Color.fromARGB(255, 176, 19, 238),
  "dragon": Color.fromARGB(208, 146, 102, 247),
  "dark": Color.fromARGB(255, 243, 115, 42),
};

Color getBackGroundColor(String type) {
  return pokemonTypeMap[type]!;
}

Color getBackGroundColor2(String type) {
  return pokemonTypeMap2[type] ?? const Color.fromARGB(255, 142, 199, 114);
}
