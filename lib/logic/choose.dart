import 'package:cactus33_helper/pb/model.pbserver.dart';

import 'define.dart';
import 'basic_tool.dart';

var chooseCache = ChooseCache();

ChooseLine chooseLine(List<PointInfo> info) {
  final key = info.hash;
  final cached = chooseCache.lines[key];
  if (cached != null) {
    return cached;
  }
  final other = List<int>.from(numbers, growable: true);
  info.forEach((element) {
    other.remove(element.number);
  });
  final e = List<double>.filled(8, 0.0);
  allListsWith(other).forEach((element) {
    e.addValues(
        moneyByInfo(info.mixWith(element)), 1.0 / (5.0 * 4.0 * 3.0 * 2.0));
  });
  final max = e.max;
  final re = ChooseLine(
      line: Line.values[max.index],
      e: max.max,
  );
  chooseCache.lines[key] = re;
  return re;
}

ChoosePosition chooseNext(List<PointInfo> info) {
  final key = info.hash;
  final cached = chooseCache.positions[key];
  if (cached != null) {
    return cached;
  }
  final otherPositions = List<int>.from(positions);
  final otherNumbers = List<int>.from(numbers);
  info.forEach((element) {
    otherPositions.remove(element.position);
    otherNumbers.remove(element.number);
  });
  final unKnownCount = 9 - info.length;
  final value = List.filled(unKnownCount, 0.0);
  final fun = info.length == 3
      ? (List<PointInfo> list) => chooseLine(list).e
      : (List<PointInfo> list) => chooseNext(list).e;
  for (var i = 0; i < unKnownCount; ++i) {
    otherNumbers.forEach((oneNumber) {
      final next = PointInfo(otherPositions[i], oneNumber);
      final infoWithNext = List<PointInfo>.from(info, growable: true)
        ..add(next);
      value[i] += fun(infoWithNext) / unKnownCount;
    });
    if (info.isEmpty) {
      print(value[i]);
    }
  }
  final re = ChoosePosition(
    position: otherPositions[value.max.index],
    e: value.max.max,
  );
  chooseCache.positions[key] = re;
  return re;
}
