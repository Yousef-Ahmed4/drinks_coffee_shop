import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/constants.dart';

myAppBar(Color color, Function lead) {
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg"),
      onPressed: () {
        lead();
      },
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: kTextColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          color: kTextColor,
        ),
      ),
      SizedBox(
        width: kDefaultPadding / 2,
      )
    ],
  );
}
