import 'package:cactus33_helper/logic/points_info.dart';
import 'package:cactus33_helper/view/number_map.dart';
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

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return NextShowWidget(
      interval: 10,
      nextLine: controller.nextLine,
      nextPosition: controller.nextPosition,
      child: NumberMap(
        numbers: List.generate(9, (index) {
          final value = controller.info.data[index];
          return value != 0 ? value : null;
        }),
        focused: controller.selected,
        onTap: (index){
          controller.selected = index;
        },
      )
    );
  }
}
