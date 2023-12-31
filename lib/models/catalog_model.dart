class CatalogModels {
  static List<Item> items = [];

  // get item by id
  Item getItemById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  //get item by position
  Item getItembyPos(int pos) => items[pos];

  void add(CatalogModels catalog) {}
}

class Item {
  late final int id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;
  late final String discount;
  late final String rating;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image,
      required this.discount,
      required this.rating});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"],
        discount: map["discount"],
        rating: map["rating"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
        "discount": discount,
        "rating": rating,
      };
}
