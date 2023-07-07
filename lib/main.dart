import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/store.dart';
import 'package:e_commerce/pages/utilities/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

import 'models/catalog_model.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Item? item;
  MyApp({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      highContrastTheme: MyTheme.girlishPink(context),
      home: HomePage(),
    );
  }
}
