
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/Product.dart';
class RatingBox extends StatelessWidget {
  final Product item;

  const RatingBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    final containerList = <Widget>[];
    for (var i = 1; i < 4; i++) {
      containerList.add(Container(
        padding: const EdgeInsets.all(0),
        child: IconButton(
          icon: (item.rating >= i
              ? Icon(
            Icons.star,
            size: _size,
          )
              : Icon(
            Icons.star_border,
            size: _size,
          )),
          color: Colors.red[500],
          onPressed: () => item.updateRating(i),
          iconSize: _size,
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: containerList,
    );
  }
}