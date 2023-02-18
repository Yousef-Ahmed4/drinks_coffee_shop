import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/screens/details/components/cart_counter.dart';

class CounterAndFavBtn extends StatelessWidget {
  const CounterAndFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset("assets/icons/heart.svg"),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffff6464),
          ),
        )
      ],
    );
  }
}
