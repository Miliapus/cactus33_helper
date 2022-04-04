import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  KeyBoard(
      {required this.onNumberTap,
      this.absorbing = false,
      this.forbid = const {},
      this.unSuggest = const {}});

  final Iterable<int> forbid;
  final Iterable<int> unSuggest;
  final bool absorbing;
  final ValueChanged<int> onNumberTap;

  Widget numberButton(int number) {
    final keyAbsorbing = forbid.contains(number) || absorbing;
    final keyUnSuggested = unSuggest.contains(number);
    return AbsorbPointer(
      absorbing: keyAbsorbing,
      child: TextButton(
        onPressed: () => onNumberTap(number),
        child: Text(number.toString()),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return keyUnSuggested || keyAbsorbing
                ? Colors.grey.withAlpha(50)
                : Colors.greenAccent;
          }),
          minimumSize:
              MaterialStateProperty.all(Size(double.infinity, double.infinity)),
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
    Widget buildRow(int a, int b, int c) {
      return Expanded(
        child: Row(
          children: [
            Expanded(child: numberButton(a)),
            SizedBox(width: 10),
            Expanded(child: numberButton(b)),
            SizedBox(width: 10),
            Expanded(child: numberButton(c)),
          ],
        ),
      );
    }

    return Column(
      children: [
        buildRow(1, 2, 3),
        SizedBox(height: 10),
        buildRow(4, 5, 6),
        SizedBox(height: 10),
        buildRow(7, 8, 9),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: buildGrid(context),
    );
  }
}
