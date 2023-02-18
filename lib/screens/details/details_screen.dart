import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/appbar.dart';
import 'package:shopapp/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;
  const DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product!.color!,
      appBar: myAppBar(product!.color!, () => Navigator.pop(context)),
      body: Body(
        product: product,
      ),
    );
  }
}
