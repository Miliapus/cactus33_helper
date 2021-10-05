import 'points_info.dart';

import 'pb/model.pb.dart';

import 'define.dart';
import 'basic_tool.dart';

extension Choose on ChooseCache {
  int? nextPositionOf(PointsInfo info) =>
      this.positions[info.hashCode]?.position;

  Line? nextLineOf(PointsInfo info) => this.lines[info.hashCode]?.line;
}

var chooseCache = ChooseCache();

ChooseLine chooseLineWithoutCache(PointsInfo info) {
  final other = info.numbersUnknown;
  final e = emptyAllMoneysInfoList();
  other.allLists.forEach((element) {
    e.addValues(
        (info + element).moneyByInfo..withRatio(1.0 / (5.0 * 4.0 * 3.0 * 2.0)));
  });
  final max = e.max;
  return ChooseLine(
    line: Line.values[max.index],
    e: max.max,
  );
}

ChooseLine chooseLine(PointsInfo info) {
  final key = info.hashCode, cached = chooseCache.lines[key];
  if (cached != null) {
    return cached;
  }
  final re = chooseLineWithoutCache(info);
  chooseCache.lines[key] = re;
  return re;
}

ChoosePosition chooseNext(PointsInfo info) {
  final key = info.hashCode, cached = chooseCache.positions[key];
  if (cached != null) {
    return cached;
  }
  final otherPositions = positions.copy, otherNumbers = numbers.copy;
  info.forEachKnownIndexed((number, position) {
    otherPositions.remove(position);
    otherNumbers.remove(number);
  });
  final unKnownCount = 9 - info.knownCount,
      value = List.filled(unKnownCount, 0.0),
      fun = unKnownCount == 6
          ? (PointsInfo newInfo) => chooseLine(newInfo).e
          : (PointsInfo newInfo) => chooseNext(newInfo).e;
  for (var i = 0; i < unKnownCount; ++i) {
    otherNumbers.forEach((oneNumber) {
      final infoWithNext = info.copySet(otherPositions[i], oneNumber);
      value[i] += fun(infoWithNext) / unKnownCount;
    });
  }
  final re = ChoosePosition(
    position: otherPositions[value.max.index],
    e: value.max.max,
  );
  chooseCache.positions[key] = re;
  return re;
}

extension PreChoose on ChooseCache {
  Line? nextLineSmartOf(PointsInfo points) {
    switch (points.knownCount) {
      case 3:
        final nextPosition = this.positions[points.hashCode]!.position,
            nextLines = points.numbersUnknown
                .map((number) =>
                    nextLineOf(points.copySet(nextPosition, number))!)
                .toSet();
        return nextLines.length == 1 ? nextLines.first : null;
      case 4:
        return lines[points.hashCode]!.line;
      default:
        return null;
    }
  }
}
