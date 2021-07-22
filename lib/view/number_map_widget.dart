import 'package:cactus33_helper/pb/model.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NumberMapController {
  Map<int, int> info = {};
  late NumberMapWidgetState _state;
  int? _selected;
  int? nextPosition;
  Line? nextLine;
  NumberMapController(this.onInfoChange);

  ValueChanged<NumberMapController> onInfoChange;

  void clear() {
    info.clear();
    _onInfoChange();
  }

  void _onInfoChange() {
    onInfoChange(this);
    _state.update();
  }

  void update(int? number) {
    if (number != null) {
      info[selected!] = number;
    } else {
      info.remove(selected);
    }
    _onInfoChange();
  }

  set selected(int? target) {
    _selected = target;
    _state.update();
    _state.widget.onSelected();
  }

  int? get selected => _selected;
}

class NumberMapWidget extends StatefulWidget {
  final NumberMapController controller;
  final VoidCallback onSelected;

  NumberMapWidget(this.controller, this.onSelected);

  @override
  State<StatefulWidget> createState() => NumberMapWidgetState();
}

class NumberMapWidgetState extends State<NumberMapWidget> {
  NumberMapController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller._state = this;
  }

  void update() => setState(() {});

  Widget pointWidget(int row, int column) {
    final index = 3 * row + column;
    return GestureDetector(
      child: Container(
          color: index == controller.selected
              ? Colors.lightBlueAccent
              : Colors.grey,
          child: Center(
            child: Text(controller.info[index]?.toString() ?? "",
            style: TextStyle(
                fontSize: 25,
            ),),
          )),
      onTap: () => controller.selected = index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
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
                                  child: pointWidget(row ~/ 2, column ~/ 2),
                                ),
                              )
                            : SizedBox(width: 10),
                      ),
                    ),
                  )
                : SizedBox(height: 10),
          ),
        ),
        foregroundPainter: NextPainter(
          nextLine: controller.nextLine,
          nextPosition: controller.nextPosition,
        ),
      ),
    );
  }
}

class NextPainter extends CustomPainter {
  NextPainter({
    this.nextLine,
    this.nextPosition,
  });

  int? nextPosition;
  Line? nextLine;

  @override
  void paint(Canvas canvas, Size size) {
    if (nextPosition != null) {
      final offSet = size.centerOffset(nextPosition!);
      final paint = Paint()
        ..strokeWidth = 5.0
        ..style = PaintingStyle.stroke
        ..color = Colors.red;
      canvas.drawCircle(offSet, 50, paint);
    } else if (nextLine != null) {
      int from = 0, to = 0;
      switch (nextLine) {
        case Line.row0:
          {
            from = 0;
            to = 2;
            break;
          }
        case Line.row1:
          {
            from = 3;
            to = 5;
            break;
          }
        case Line.row2:
          {
            from = 6;
            to = 8;
            break;
          }
        case Line.column0:
          {
            from = 0;
            to = 6;
            break;
          }
        case Line.row0:
          {
            from = 1;
            to = 7;
            break;
          }
        case Line.row0:
          {
            from = 2;
            to = 8;
            break;
          }
        case Line.from00:
          {
            from = 0;
            to = 8;
            break;
          }
        case Line.from02:
          {
            from = 2;
            to = 6;
            break;
          }
      }
      final paint = Paint()
        ..strokeWidth = 5.0
        ..style = PaintingStyle.stroke
        ..color = Colors.red;
      canvas.drawLine(size.centerOffset(from), size.centerOffset(to), paint);
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
