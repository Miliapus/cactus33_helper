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

  Widget numberButton(int row, int column) {
    final number = 3 * row + column + 1;
    final keyAbsorbing = forbid.contains(number) || absorbing;
    final keyUnSuggested = unSuggest.contains(number);
    return AbsorbPointer(
      absorbing: keyAbsorbing,
      child: TextButton(
        onPressed: () => onNumberTap(number),
        child: Text(number.toString()),
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.resolveWith(
                  (states) {
                return keyUnSuggested || keyAbsorbing ?Colors.grey.withAlpha(50) : Colors.greenAccent;
              }),
          minimumSize:
              MaterialStateProperty.all(Size(double.infinity, double.infinity)),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Column(
        children: List.generate(
          5,
          (row) => row % 2 == 0
              ? Expanded(
                  child: Row(
                    children: List.generate(
                      5,
                      (column) => column % 2 == 0
                          ? Expanded(
                              child: Center(
                                child: numberButton(row ~/ 2, column ~/ 2),
                              ),
                            )
                          : SizedBox(
                              width: 10,
                            ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: body(context),
    );
  }
}
