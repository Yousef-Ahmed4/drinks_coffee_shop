import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/product.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
            ),
            Row(
              children: [
                ColorDot(
                  color: product!.color!,
                  isSelected: true,
                ),
                ColorDot(color: Color(0xfff8c078)),
                ColorDot(color: Color(0xffa29b9b)),
              ],
            ),
          ],
        ),
      ),
      RichText(
        text: TextSpan(style: TextStyle(color: kTextColor), children: [
          TextSpan(text: 'Size\n'),
          TextSpan(
            text: "${product!.size!} cm",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ]),
      )
    ]);
  }
}

class ColorDot extends StatelessWidget {
  final Color? color;
  final bool? isSelected;
  const ColorDot({
    Key? key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 10),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected! ? (color)! : Colors.transparent),
      ),
      child: DecoratedBox(
          decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      )),
    );
  }
}
