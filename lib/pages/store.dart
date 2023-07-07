import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModels catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog as CatalogModels;
  }
}
