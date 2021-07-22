import 'next_painter.dart';
import 'package:cactus33_helper/logic/logic.dart';
import 'package:flutter/material.dart';

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
            child: Text(
              controller.info[index]?.toString() ?? "",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
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
