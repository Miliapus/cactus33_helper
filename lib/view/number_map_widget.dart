import 'package:cactus33_helper/logic/points_info.dart';
import 'package:cactus33_helper/view/number_cell.dart';

import 'next_painter.dart';
import 'package:cactus33_helper/logic/logic.dart';
import 'package:flutter/material.dart';

class NumberMapController {
  PointsInfo info = PointsInfo();
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

  ///更新焦点位置的数字 如果这个数字在其他位置存在 那个位置将被重制
  void update(int number) {
    info.safeUpdate(selected!, number);
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

  String text(int index) {
    final value = controller.info[index];
    return value == unKnownNumber ? '' : value.toString();
  }

  void update() => setState(() {});

  Widget pointWidget(int row, int column) {
    final index = 3 * row + column;
    return GestureDetector(
      child: NumberCell(
        number: text(index),
        focused: controller.selected == index,
      ),
      onTap: () => controller.selected = index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NextShowWidget(
      interval: 10,
      nextLine: controller.nextLine,
      nextPosition: controller.nextPosition,
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
    );
  }
}
