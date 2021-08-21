const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const positions = [0, 1, 2, 3, 4, 5, 6, 7, 8];

const money = <double>[
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  10000.0,
  36.0,
  720.0,
  360.0,
  80.0,
  252.0,
  108.0,
  72.0,
  54.0,
  180.0,
  72.0,
  180.0,
  119.0,
  36.0,
  306.0,
  1080.0,
  144.0,
  1800.0,
  3600.0,
];

class PointInfo {
  PointInfo(this.position, this.number);
  final int position;
  final int number;
}
class MaxOfList<T> {
  MaxOfList(this.index, this.max);
  final int index;
  final T max;
}

typedef Points = List<PointInfo>;