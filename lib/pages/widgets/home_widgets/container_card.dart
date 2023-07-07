import 'package:e_commerce/models/catalog_model.dart';
import 'package:e_commerce/pages/widgets/home_details_page.dart';
import 'package:e_commerce/pages/widgets/home_widgets/item_card_wdget.dart';
import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 352,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            Item? item = CatalogModels.items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      item: item,
                    ),
                  ),
                );
              },
              child: ItemCardWidget(
                productName: item.name,
                price: item.price.toString(),
                discount: item.discount.toString(),
                image: item.image.toString(),
                rating: '',
              ),
            );
          }),
    );;
  }
}
