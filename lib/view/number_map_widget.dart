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
    // TODO: implement initState
    super.initState();
    widget.controller._state = this;
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 290,
      child: Stack(
        children: List.generate(
            9,
            (index) => Positioned(
                  child: GestureDetector(
                    child: Container(
                        color: index == widget.controller.selected
                            ? Colors.lightBlueAccent
                            : Colors.grey,
                        width: 90,
                        height: 90,
                        child: Center(
                          child: Text("1"),
                        )),
                    onTap: () => widget.controller.selected = index,
                  ),
                  left: 100 * (index % 3),
                  top: 100 * (index ~/ 3).toDouble(),
                )),
      ),
    );
  }
}
