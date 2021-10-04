import 'define.dart';

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
  List<E> copyWithout(E value) {
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

extension MoneyOfValue on int {
  double get money => moneyOfValue[this];
}

extension Possible<E> on List<E> {
  List<List<E>> get allLists => _allLists(length, length);

  List<List<E>> _allLists(int size, int realSize) {
    if (realSize > 1) {
      final re = List<List<E>>.empty(growable: true);
      final subListSize = realSize - 1;
      forEach((element) {
        re.addAll(copyWithout(element)
            ._allLists(size, subListSize)
            .map((list) => list..[subListSize] = element));
      });
      return re;
    } else {
      return [List.filled(size, first, growable: true)];
    }
  }
}
