import 'package:flutter/material.dart';

class NumberCell extends StatelessWidget {
  final String? number;
  final bool focused;

  const NumberCell({
    Key? key,
    this.number,
    this.focused = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (focused) {
      backgroundColor = Colors.lightBlueAccent;
    } else {
      backgroundColor = Colors.transparent;
    }
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Center(
          child: Text(
            number ?? "",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ));
  }

}
