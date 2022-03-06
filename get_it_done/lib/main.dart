import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(create: (context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
      create: (context) => ColorThemeData(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider.of<ItemData>(context).loadItemsFromSharedPref();
    // Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();

    return Consumer2<ItemData, ColorThemeData>(
        builder: (context, itemData, colorThemeData, child) {
      itemData.loadItemsFromSharedPref();
      colorThemeData.loadThemeFromSharedPref();

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ColorThemeData>(context).selectedThemeData,
        home: SplashWidget(),
      );
    });
  }
}

