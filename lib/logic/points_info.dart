import 'basic_tool.dart';
import 'define.dart';

mixin withPointsInfoData {
  late final List<int> _data;

  void remove(int value) {
    for (var i = 0; i < 9; ++i) {
      if (_data[i] == value) {
        _data[i] = unKnownNumber;
        return;
      }
    }
  }

  List<int> get numbersUnknown => (numbers.toSet()..removeAll(_data)).toList();

  @override
  int get hashCode {
    int re = _data[0];
    for (var i = 1; i < 9; ++i) {
      //选择*10而不是<<4是为了避免突破int32
      re *= 10;
      re += _data[i];
    }
    return re;
  }

  void clear() {
    for (var i = 0; i < 9; ++i) {
      _data[i] = unKnownNumber;
    }
  }

  int get knownCount {
    int re = 0;
    for (var i = 0; i < 9; ++i) {
      if (_data[i] != 0) {
        re += 1;
      }
    }
    return re;
  }

  forEachKnownIndexed(void action(int number, int index)) {
    for (var i = 0; i < 9; ++i) {
      if (_data[i] != 0) {
        action(_data[i], i);
      }
    }
  }

  int operator [](int index) => _data[index];

  void operator []=(int index, int value) => _data[index] = value;

  void safeUpdate(int index, int value) {
    if (value != unKnownNumber) {
      remove(value);
    }
    this[index] = value;
  }
}

class PointsInfo with withPointsInfoData {
  List<int> get data => _data;

  PointsInfo() {
    this._data = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  }

  PointsInfo.copyOf(PointsInfo other) {
    this._data = other._data.copy;
  }

  PointsInfo copySet(int position, int number) {
    return copy.._data[position] = number;
  }

  PointsInfo get copy => PointsInfo.copyOf(this);

//根据现有的位置-数字序列和一个数字序列生成完整的数字表，数字序列上的数字将被按顺序填充到表中空位
  PointsInfo operator +(List<int> list) {
    final re = PointsInfo();
    for (var i = 0, j = 0, targetData = re._data; i < 9; ++i) {
      if (_data[i] != 0) {
        targetData[i] = _data[i];
      } else {
        targetData[i] = list[j];
        ++j;
      }
    }
    return re;
  }

  List<double> get moneyByInfo {
    int sumOf(int i1, int i2, int i3) => _data[i1] + _data[i2] + _data[i3];
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
