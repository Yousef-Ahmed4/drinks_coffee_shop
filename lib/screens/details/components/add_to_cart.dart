import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product!.color!,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/add_to_cart.svg"),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: product!.color!,
                  borderRadius: BorderRadius.circular(18)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "BUY  NOW",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
