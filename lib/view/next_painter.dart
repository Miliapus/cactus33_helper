import 'package:cactus33_helper/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:draw_oval/draw_oval.dart';
const t1 = 0.2;
const t2 = 0.5;

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
    final lineSize = (size.width - 20) / 3;
    if (nextPosition != null) {
      final offSet = size.centerOffset(nextPosition!);
      canvas.drawCircle(offSet, lineSize * 0.4, nextPaint);
    } else if (nextLine != null) {
      final fromTo = nextLine!.fromTo;
      final from = size.centerOffset(fromTo.from),
          to = size.centerOffset(fromTo.to),
          change = to - from,
          middle = (from + to) / 2,
          a = from - change * (t1 / 2),
          b = to + change * (t1 / 2),
          c = middle + change.orthogonal * (t2 / 2),
          d = middle - change.orthogonal * (t2 / 2);
      canvas.drawOvalWith(middle, 200,100,0.78,nextPaint);
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

extension Math on Offset {
  Offset get orthogonal => Offset(dy, -dx);
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
