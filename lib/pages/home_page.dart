import 'package:e_commerce/models/catalog_model.dart';
import 'package:e_commerce/pages/store.dart';
import 'package:e_commerce/pages/utilities/themes.dart';
import 'package:e_commerce/pages/widgets/home_widgets/catalogHeader.dart';
import 'package:e_commerce/pages/widgets/home_widgets/container_card.dart';
import 'package:e_commerce/pages/widgets/home_widgets/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  final Item? item;
  HomePage({
    Key? key,
    this.item,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData();
    dropdownValue = "option";
  }

  double value = 3.5;
  bool showClearChip = false;
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  String dropdownValue = "option 1";
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    item: widget.item!,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: CatalogModels.items.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.lightBluishColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextFieldWithDropdown(),
                    CatalogHeader(
                      title: "Smartphones",
                    ),
                    ContainerCard(),
                    CatalogHeader(
                      title: "Laptops",
                    ),
                    ContainerCard(),
                    CatalogHeader(
                      title: "Fragrance",
                    ),
                    ContainerCard(),
                    CatalogHeader(
                      title: "Skincare",
                    ),
                    ContainerCard(),
                    CatalogHeader(
                      title: "Groceries",
                    ),
                    ContainerCard(),
                    CatalogHeader(
                      title: "Home Decoration",
                    ),
                    ContainerCard(),
                  ],
                ),
        ),
      ),
    );
  }

}
