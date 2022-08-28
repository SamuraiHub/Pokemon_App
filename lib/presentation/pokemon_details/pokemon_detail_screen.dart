import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get/get_core/src/get_main.dart';
import 'package:pokedex/data/models/pokemon_model.dart';
import '../../data/constants.dart';
import '../../translations/locale_keys.g.dart';
import 'about_pokemon.dart';
import 'base_stats.dart';

// display details of a pokemon including stats and features
class PokemonDetailScreen extends StatefulWidget {
  final PokemonModel pokemon;
  const PokemonDetailScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  void init(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void initState() {
    super.initState();
    init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.red.shade900,
        title: Text(
          LocaleKeys.spTitle.tr(),
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                color: getBackGroundColor(widget.pokemon.types![0].type!.name!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pokemon.name!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(e.type!.name!.tr()),
                              decoration: BoxDecoration(
                                color: getBackGroundColor2(
                                  widget.pokemon.types![0].type!.name!,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color:
                      getBackGroundColor(widget.pokemon.types![0].type!.name!),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: TabBar(
                            labelPadding: const EdgeInsets.all(10),
                            indicatorColor: getBackGroundColor(
                                widget.pokemon.types![0].type!.name!),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            tabs: [
                              Text('About'.tr()),
                              Text('Base Stats'.tr()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                AboutPokemon(pokemon: widget.pokemon),
                                BaseStats(pokemon: widget.pokemon),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(widget.pokemon.imageUrl),
            ),
          )
        ],
      ),
    );
  }
}
