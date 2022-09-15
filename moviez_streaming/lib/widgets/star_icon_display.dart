// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarIconDisplay extends StatelessWidget {
  final int value;
  const StarIconDisplay({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? CupertinoIcons.star_fill : CupertinoIcons.star,
          color: Colors.amber,
          size: 16,
        );
      }),
    );
  }
}
