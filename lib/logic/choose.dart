import 'pb/model.pb.dart';

import 'define.dart';
import 'basic_tool.dart';

var chooseCache = ChooseCache();

ChooseLine chooseLine(PointsInfo info) {
  final key = info.hashValue, cached = chooseCache.lines[key];
  if (cached != null) {
    return cached;
  }
  final other = numbers.copy
    ..removeWhere(
        (number) => info.any((pointInfo) => pointInfo.number == number));
  final e = emptyAllMoneysInfoList();
  other.allLists.forEach((element) {
    e.addValues(info.mixWith(element).moneyByInfo
      ..withRatio(1.0 / (5.0 * 4.0 * 3.0 * 2.0)));
  });
  final max = e.max,
      re = ChooseLine(
        line: Line.values[max.index],
        e: max.max,
      );
  chooseCache.lines[key] = re;
  return re;
}

ChoosePosition chooseNext(PointsInfo info) {
  final key = info.hashValue, cached = chooseCache.positions[key];
  if (cached != null) {
    return cached;
  }
  final otherPositions = positions.copy, otherNumbers = numbers.copy;
  info.forEach((element) {
    otherPositions.remove(element.position);
    otherNumbers.remove(element.number);
  });
  final unKnownCount = 9 - info.length,
      value = List.filled(unKnownCount, 0.0),
      fun = info.length == 3
          ? (List<PointInfo> list) => chooseLine(list).e
          : (List<PointInfo> list) => chooseNext(list).e;
  for (var i = 0; i < unKnownCount; ++i) {
    otherNumbers.forEach((oneNumber) {
      final next = PointInfo(otherPositions[i], oneNumber),
          infoWithNext = info.copy..add(next);
      value[i] += fun(infoWithNext) / unKnownCount;
    });
    assert(() {
      if (info.isEmpty) {
        print(value[i]);
      }
      return true;
    }());
  }
  final re = ChoosePosition(
    position: otherPositions[value.max.index],
    e: value.max.max,
  );
  chooseCache.positions[key] = re;
  return re;
}

extension PreChoose on ChooseCache {
  Line? nextLineOf(PointsInfo points) {
    final size = points.length;
    switch (size) {
      case 3:
        final nextPosition = this.positions[points.hashValue]!.position,
            has = points.map((e) => e.number).toSet(),
            nextLines = <Line>{};
        numbers.where((number) => !has.contains(number)).forEach((element) {
          nextLines.add(
              lines[(points + [PointInfo(nextPosition, element)]).hashValue]!.line);
        });
        return nextLines.isNotEmpty ? nextLines.first : null;
      case 4:
        return lines[points.hashValue]!.line;
      default:
        return null;
    }
  }
}
