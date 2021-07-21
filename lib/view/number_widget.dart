import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget{
  final int number;
  NumberWidget(this.number);

  @override
  Widget build(BuildContext context) =>Container(
    width: 50,
    height: 50,
    margin: EdgeInsets.all(10),
    child: Text(number.toString()),
  );

}
class UnKnownWidget extends StatelessWidget{
@override
Widget build(BuildContext context) =>Container(
  width: 50,
  height: 50,
  margin: EdgeInsets.all(10),
);

}
class NextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) =>Container(
    width: 50,
    height: 50,
    margin: EdgeInsets.all(10),
  );

}