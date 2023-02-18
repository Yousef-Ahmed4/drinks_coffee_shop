import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buldOutlineButton(
          icon: Icons.remove,
          press: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buldOutlineButton(
          icon: Icons.add,
          press: true,
        ),
      ],
    );
  }

  Container buldOutlineButton({IconData? icon, bool? press}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          )),
      child: TextButton(
        onPressed: () {
          if (press!) {
            setState(() {
              numOfItems++;
            });
          }
          if (!press) {
            if (numOfItems > 1) {
              setState(
                () {
                  numOfItems--;
                },
              );
            }
          }
        },
        child: Icon(icon),
      ),
    );
  }
}
