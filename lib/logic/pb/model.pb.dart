///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pbenum.dart';

export 'model.pbenum.dart';

class ChoosePosition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChoosePosition', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position', $pb.PbFieldType.O3)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'e', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ChoosePosition._() : super();
  factory ChoosePosition({
    $core.int? position,
    $core.double? e,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (e != null) {
      _result.e = e;
    }
    return _result;
  }
  factory ChoosePosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChoosePosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChoosePosition clone() => ChoosePosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChoosePosition copyWith(void Function(ChoosePosition) updates) => super.copyWith((message) => updates(message as ChoosePosition)) as ChoosePosition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChoosePosition create() => ChoosePosition._();
  ChoosePosition createEmptyInstance() => create();
  static $pb.PbList<ChoosePosition> createRepeated() => $pb.PbList<ChoosePosition>();
  @$core.pragma('dart2js:noInline')
  static ChoosePosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChoosePosition>(create);
  static ChoosePosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get e => $_getN(1);
  @$pb.TagNumber(2)
  set e($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasE() => $_has(1);
  @$pb.TagNumber(2)
  void clearE() => clearField(2);
}

class ChooseLine extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChooseLine', createEmptyInstance: create)
    ..e<Line>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'line', $pb.PbFieldType.OE, defaultOrMaker: Line.row0, valueOf: Line.valueOf, enumValues: Line.values)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'e', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ChooseLine._() : super();
  factory ChooseLine({
    Line? line,
    $core.double? e,
  }) {
    final _result = create();
    if (line != null) {
      _result.line = line;
    }
    if (e != null) {
      _result.e = e;
    }
    return _result;
  }
  factory ChooseLine.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChooseLine.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChooseLine clone() => ChooseLine()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChooseLine copyWith(void Function(ChooseLine) updates) => super.copyWith((message) => updates(message as ChooseLine)) as ChooseLine; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChooseLine create() => ChooseLine._();
  ChooseLine createEmptyInstance() => create();
  static $pb.PbList<ChooseLine> createRepeated() => $pb.PbList<ChooseLine>();
  @$core.pragma('dart2js:noInline')
  static ChooseLine getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChooseLine>(create);
  static ChooseLine? _defaultInstance;

  @$pb.TagNumber(1)
  Line get line => $_getN(0);
  @$pb.TagNumber(1)
  set line(Line v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLine() => $_has(0);
  @$pb.TagNumber(1)
  void clearLine() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get e => $_getN(1);
  @$pb.TagNumber(2)
  set e($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasE() => $_has(1);
  @$pb.TagNumber(2)
  void clearE() => clearField(2);
}

class ChooseCache extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChooseCache', createEmptyInstance: create)
    ..m<$core.int, ChoosePosition>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positions', entryClassName: 'ChooseCache.PositionsEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OM, valueCreator: ChoosePosition.create)
    ..m<$core.int, ChooseLine>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lines', entryClassName: 'ChooseCache.LinesEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OM, valueCreator: ChooseLine.create)
    ..hasRequiredFields = false
  ;

  ChooseCache._() : super();
  factory ChooseCache({
    $core.Map<$core.int, ChoosePosition>? positions,
    $core.Map<$core.int, ChooseLine>? lines,
  }) {
    final _result = create();
    if (positions != null) {
      _result.positions.addAll(positions);
    }
    if (lines != null) {
      _result.lines.addAll(lines);
    }
    return _result;
  }
  factory ChooseCache.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChooseCache.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChooseCache clone() => ChooseCache()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChooseCache copyWith(void Function(ChooseCache) updates) => super.copyWith((message) => updates(message as ChooseCache)) as ChooseCache; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChooseCache create() => ChooseCache._();
  ChooseCache createEmptyInstance() => create();
  static $pb.PbList<ChooseCache> createRepeated() => $pb.PbList<ChooseCache>();
  @$core.pragma('dart2js:noInline')
  static ChooseCache getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChooseCache>(create);
  static ChooseCache? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, ChoosePosition> get positions => $_getMap(0);

  @$pb.TagNumber(2)
  $core.Map<$core.int, ChooseLine> get lines => $_getMap(1);
}

