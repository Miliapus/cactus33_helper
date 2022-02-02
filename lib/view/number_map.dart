import 'package:flutter/widgets.dart';

import 'number_cell.dart';

mixin NumberGridBuilder {
  List<int> get indexList => [0, 1, 2, 3, 4, 5, 6, 7, 8];

  double get interval;

  Widget pointWidget(int index);

  Widget buildGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: interval,
      mainAxisSpacing: interval,
      children: indexList.map(pointWidget).toList(),
    );
  }
}

class NumberMap extends StatelessWidget with NumberGridBuilder {
  final int? focused;
  final List<int?> numbers;

  @override
  final double interval = 10;

  NumberMap({Key? key, required this.numbers, this.focused})
      : assert(numbers.length == 9);

  NumberMap.fromMap(
      {Key? key, required Map<int, int> mapTypeInfo, int? focused})
      : this(key: key, numbers: mapTypeInfo.listTypeNumbers, focused: focused);

  Widget pointWidget(int index) {
    return GestureDetector(
      child: NumberCell(
        number: numbers[index]?.toString() ?? "",
        focused: index == focused,
      ),
      onTap: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGrid(context);
  }
}

extension convert on Map<int, int> {
  List<int?> get listTypeNumbers {
    return List.generate(9, (index) => this[index]);
  }
}
