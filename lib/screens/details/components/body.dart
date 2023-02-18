import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/details/components/add_to_cart.dart';
import 'package:shopapp/screens/details/components/color_and_size.dart';
import 'package:shopapp/screens/details/components/counter_and_fav_btn.dart';
import 'package:shopapp/screens/details/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  Product? product;
  Body({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  right: kDefaultPadding,
                  left: kDefaultPadding,
                ),
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    ColorAndSize(product: product),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Text(
                        product!.description!,
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    CounterAndFavBtn(),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    AddToCart(product: product),
                  ],
                ),
              ),
              ProductTitleWithImage(product: product),
            ]),
          )
        ],
      ),
    );
  }
}
