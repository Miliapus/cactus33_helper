const unKnownNumber = 0;
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const positions = [0, 1, 2, 3, 4, 5, 6, 7, 8];

const moneyOfValue = <double>[
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

class MaxOfList<T> {
  MaxOfList(this.index, this.max);

  final int index;
  final T max;
}

//每行的回报数据 顺序是 一二三行 一二三列 00到22 02到20
typedef AllMoneysInfoList = List<double>;
//完整的表，顺序是 00 01 02 10 11 12 20 21 22
typedef AllPointsInfoList = List<int>;
// typedef PointsInfo = List<PointInfo>;
