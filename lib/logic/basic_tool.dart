import 'define.dart';

extension Hash on PointsInfo {
  int get hashValue {
    var re = 0;
    map((e) => e.position * 10 + e.number).toList()
      ..sort()
      ..forEach((element) {
        re *= 100;
        re += element;
      });
    return re;
  }
}

extension Convert on Map<int, int> {
  PointsInfo get infoList =>
      entries.map((e) => PointInfo(e.key, e.value)).toList();
}

AllMoneysInfoList emptyAllMoneysInfoList() => AllMoneysInfoList.filled(8, 0);

extension E on AllMoneysInfoList {
  void withRatio(double ratio) {
    final l = length;
    for (var i = 0; i < l; ++i) {
      this[i] *= ratio;
    }
  }

  void addValues(AllMoneysInfoList values) {
    final l = length;
    for (var i = 0; i < l; ++i) {
      this[i] += values[i];
    }
  }
}

extension Copy<E> on List<E> {
  copyWithout(E value) {
    return copy..remove(value);
  }

  List<E> get copy => toList();
}

extension Find on AllMoneysInfoList {
  MaxOfList<double> get max {
    var maxValue = double.negativeInfinity, position = 0;
    final l = length;
    for (var i = 0; i < l; ++i) {
      if (this[i] > maxValue) {
        maxValue = this[i];
        position = i;
      }
    }
    return MaxOfList(position, maxValue);
  }
}

//根据现有的位置-数字序列和一个数字序列生成完整的数字表，数字序列上的数字将被按顺序填充到表中空位
extension Info on List<PointInfo> {
  AllPointsInfoList mixWith(List<int> other) {
    final re = List<int>.filled(9, 0);
    forEach((element) {
      re[element.position] = element.number;
    });
    for (var i = 0, j = 0; i < 9; ++i) {
      if (re[i] == 0) {
        re[i] = other[j];
        ++j;
      }
    }
    return re;
  }
}

extension MoneyOfValue on int {
  double get money => moneyOfValue[this];
}

extension Money on AllPointsInfoList {
  List<double> get moneyByInfo {
    int sumOf(int i1, int i2, int i3) => this[i1] + this[i2] + this[i3];
    int sumRow(int row) => sumOf(3 * row, 3 * row + 1, 3 * row + 2);
    int sumColumn(int column) => sumOf(column, column + 3, column + 6);
    int sum00To22() => sumOf(0, 4, 8);
    int sum02to20() => sumOf(2, 4, 6);
    return [
      sumRow(0).money,
      sumRow(1).money,
      sumRow(2).money,
      sumColumn(0).money,
      sumColumn(1).money,
      sumColumn(2).money,
      sum00To22().money,
      sum02to20().money,
    ];
  }
}

extension Possible on List<int> {
  List<List<int>> get allLists {
    if (length > 1) {
      final re = List<List<int>>.empty(growable: true);
      forEach((element) {
        re.addAll(copyWithout(element)
            .allLists
            .map((list) => list..add(element))
            .toList());
      });
      return re;
    } else {
      return map((e) => List.filled(1, e, growable: true)).toList();
    }
  }
}
