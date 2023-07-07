import 'package:e_commerce/pages/widgets/home_widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String? productName;
  final String? price;
  final String? discount;
  final String? image;
  final String? rating;
  ItemCardWidget(
      {Key? key,
      required this.productName,
      required this.price,
      required this.discount,
      required this.image,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            height: 320,
            width: 210,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.grey.shade200,
                ),
                BoxShadow(
                  offset: Offset(-2, 0),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.grey.shade200,
                )
              ],
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
              bottom: 110,
              child: Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Image.network(
                  image.toString(),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            height: 50,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              discount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 110,
              width: 210,
              padding: const EdgeInsets.only(
                  left: 16, top: 10, bottom: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StarRatingWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
