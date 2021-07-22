import 'define.dart';

extension Hash on List<PointInfo> {
  int get hash {
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
extension Convert on Map<int,int> {
  List<PointInfo> get infoList =>entries
      .map((e) => PointInfo(e.key, e.value))
      .toList();
}
extension E on List<double> {
  void addValues(List<double> values, double p) {
    final l = length;
    for (var i = 0; i < l; ++i) {
      this[i] += values[i] * p;
    }
  }
}

extension Find on List<double> {
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

List<double> moneyByInfo(List<int> info) {
  final get = List.filled(8, 0);
  get[0] = info.sumRow(0);
  get[1] = info.sumRow(1);
  get[2] = info.sumRow(2);
  get[3] = info.sumColumn(0);
  get[4] = info.sumColumn(1);
  get[5] = info.sumColumn(2);
  get[6] = info.sum00To22;
  get[7] = info.sum02to20;
  return get.map((e) => money[e]).toList();
}

extension Info on List<PointInfo> {
  List<int> mixWith(List<int> other) {
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

extension Sum on List<int> {
  int sumOf(int i1, int i2, int i3) {
    return this[i1] + this[i2] + this[i3];
  }

  int sumRow(int row) => sumOf(3 * row, 3 * row + 1, 3 * row + 2);

  int sumColumn(int column) => sumOf(column, column + 3, column + 6);

  int get sum00To22 => sumOf(0, 4, 8);

  int get sum02to20 => sumOf(2, 4, 6);
}

List<List<int>> allListsWith(List<int> list) {
  if (list.length > 1) {
    var re = List<List<int>>.empty(growable: true);
    list.forEach((element) {
      re.addAll(allListsWith(List.from(list)..remove(element))
          .map((e) => e..add(element))
          .toList());
    });
    return re;
  } else {
    return list.map((e) => List.filled(1, e, growable: true)).toList();
  }
}