import 'package:e_commerce/pages/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart_model.dart';
import '../models/catalog_model.dart';

class CartPage extends StatelessWidget {
  Item? item;
  CartPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cart Page",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: context.canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartHolder(
            item: item,
          ),
        ],
      ),
    );
  }
}

class _CartHolder extends StatelessWidget {
  Item? item;
  _CartHolder({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 80,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Price",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item!.price.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isNotEmpty
        ? Center(
            child: Text(
            "No any products added to cart yet...",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ))
        : ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
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
                            offset: Offset(2, 2),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.grey.shade300,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                      ),
                      child: Image.network(
                          fit: BoxFit.cover,
                          "https://lh3.googleusercontent.com/qRQPjHrhRVIs-xnfNSyiPXOH2vH97ylMacgbTKebqJtRfNH3LlYo8pN-5igsLDWUH62tGl5zNpTsl5xd8SprzGmXoCEmWFOi2-2cQVGS-r3PaRXHt62DmJHq-jrYX0UQvWZ9BA=s800-c"),
                    ),
                    const Positioned(
                      left: 165,
                      top: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I Phone X",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$ 999",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "DELETE",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
