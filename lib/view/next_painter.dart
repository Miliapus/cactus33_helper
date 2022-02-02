import 'package:cactus33_helper/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:draw_oval/draw_oval.dart';

const t1 = 0.2;
const t2 = 0.5;

mixin GridCenterProvider {
  double get interval;

  Offset centerOffset(int position, double width) {
    final oneSize = (width - 2 * 10) / 3,
        row = position ~/ 3,
        column = position % 3;
    return Offset(column * (oneSize + 10) + oneSize / 2,
        row * (oneSize + 10) + oneSize / 2);
  }
}

class NextShowWidget extends StatelessWidget {
  final double interval;

  final Widget? child;

  final int? nextPosition;

  final Line? nextLine;

  const NextShowWidget(
      {Key? key,
      this.child,
      this.nextPosition,
      this.nextLine,
      this.interval = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: child,
        foregroundPainter: NextPainter(
          interval: interval,
          nextLine: nextLine,
          nextPosition: nextPosition,
        ),
      ),
    );
  }
}

class NextPainter extends CustomPainter with GridCenterProvider {
  @override
  final double interval;

  int? nextPosition;

  Line? nextLine;

  final nextPaint = Paint()
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke
    ..color = Colors.red;

  NextPainter({
    this.interval = 0,
    this.nextLine,
    this.nextPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final lineSize = (size.width - 20) / 3;
    if (nextPosition != null) {
      final offSet = centerOffset(nextPosition!, size.width);
      canvas.drawCircle(offSet, lineSize * 0.4, nextPaint);
    }
    if (nextLine != null) {
      final fromTo = nextLine!.fromTo,
          from = centerOffset(fromTo.from, size.width),
          to = centerOffset(fromTo.to, size.width);
      canvas.drawOvalBasedOnLine(from, to, 1.3, 3.3, nextPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
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
