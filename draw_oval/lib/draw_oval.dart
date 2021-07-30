library draw_oval;

import 'package:flutter/painting.dart';

extension draw on Canvas {
  drawOvalWith(
      Offset center, double width, double height, double radians, Paint paint) {
    save();
    translate(center.dx, center.dy);
    rotate(radians);
    drawOval(Rect.fromCenter(center: Offset.zero, width: width, height: height),
        paint);
    translate(-center.dx, -center.dy);
    restore();
  }

  drawOvalBasedOnLine(Offset from, Offset to, double widthFactor,
      double aspectRatio, Paint paint) {
    final line = (to - from), d = line.distance, width = d * widthFactor;
    drawOvalWith(
        (from + to) / 2, width, width / aspectRatio, line.direction, paint);
  }
}
