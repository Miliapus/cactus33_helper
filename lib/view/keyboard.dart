import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  KeyBoard(this.onNumberTap);
  final ValueChanged<int> onNumberTap;
  @override
  Widget build(BuildContext context)=>Container(
    width: double.infinity,
    height: 150,
    child: Stack(
      children: List.generate(9, (index) =>
          Positioned(child:
          TextButton(
            child: Text("Submit"),
            onPressed: () {},
          ),
              left: 100 * (index % 3),
        top: 100 * (index ~/ 3).toDouble(),
          )
      ),
    ),
  );
}