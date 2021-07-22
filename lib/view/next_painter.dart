import 'package:cactus33_helper/logic/logic.dart';
import 'package:flutter/material.dart';
class NextPainter extends CustomPainter {
  int? nextPosition;
  Line? nextLine;
  final nextPaint = Paint()
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke
    ..color = Colors.red;

  NextPainter({
    this.nextLine,
    this.nextPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (nextPosition != null) {
      final offSet = size.centerOffset(nextPosition!);
      canvas.drawCircle(offSet, 50, nextPaint);
    } else if (nextLine != null) {
      final fromTo = nextLine!.fromTo;
      canvas.drawLine(size.centerOffset(fromTo.from),
          size.centerOffset(fromTo.to), nextPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension Position on Size {
  Offset centerOffset(int position) {
    final oneSize = (width - 2 * 10) / 3,
        row = position ~/ 3,
        column = position % 3;
    return Offset(column * (oneSize + 10) + oneSize / 2,
        row * (oneSize + 10) + oneSize / 2);
  }
}

class FromTo {
  final int from;
  final int to;

  const FromTo(this.from, this.to);
}

extension Draw on Line {
  static const lineFromTos = [
    FromTo(0, 2),
    FromTo(3, 5),
    FromTo(6, 8),
    FromTo(0, 6),
    FromTo(1, 7),
    FromTo(2, 8),
    FromTo(0, 8),
    FromTo(2, 6)
  ];

  FromTo get fromTo => lineFromTos[Line.values.indexOf(this)];
}
