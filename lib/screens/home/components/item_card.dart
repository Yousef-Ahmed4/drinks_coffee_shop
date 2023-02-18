import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';
import '../../../models/product.dart';

class ItemCard extends StatelessWidget {
  Product? product;

  ItemCard({
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            //  MediaQuery.of(context).size.height * 3 / 14,
            decoration: BoxDecoration(
              color: product!.color!,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: product!.id!,
              child: Image.asset(product!.image!),
            ),
          ),
          Text(
            product!.title!,
            style: TextStyle(color: kTextLightColor),
          ),
          Text(
            '\$ ' + product!.price!.toString(),
            style: TextStyle(color: kTextColor),
          )
        ],
      ),
    );
  }
}
