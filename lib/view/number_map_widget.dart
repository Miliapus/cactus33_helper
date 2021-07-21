import 'package:flutter/material.dart';

class NumberMapController {
  late NumberMapWidgetState _state;
  int? _selected;

  set selected(int? target) {
    _selected = target;
    _state.update();
  }

  int? get selected => _selected;
}

class NumberMapWidget extends StatefulWidget {
  final NumberMapController controller;

  NumberMapWidget(this.controller);

  @override
  State<StatefulWidget> createState() => NumberMapWidgetState();
}

class NumberMapWidgetState extends State<NumberMapWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
  }

  void update() => setState(() {});

  Widget pointWidget(int row, int column) {
    final index = 3 * row + column;
    return GestureDetector(
      child: Container(
          // margin: EdgeInsets.only(
          //   right: column < 2 ? 10 : 0,
          //   bottom: row < 2 ? 10 : 0,
          // ),
          color: index == widget.controller.selected
              ? Colors.lightBlueAccent
              : Colors.grey,
          child: Center(
            child: Text("1"),
          )),
      onTap: () => widget.controller.selected = index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
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
}
