import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/presentation/pokemons/pokemons_screen.dart';
import 'package:pokedex/translations/locale_keys.g.dart';
import 'package:pokedex/translations/translations.dart';

import 'data/datasources/remote_data_source.dart';

// maon method
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: Translations.all,
      path: 'assets/translations',
      fallbackLocale: Translations.all[0],
      child: const MyApp()));
}

// main app class for displaying pokemons
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: LocaleKeys.appTitle.tr(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: PokemonScreen(),
    );
  }
}
