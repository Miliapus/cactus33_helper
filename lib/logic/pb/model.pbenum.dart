///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Line extends $pb.ProtobufEnum {
  static const Line row0 = Line._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'row0');
  static const Line row1 = Line._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'row1');
  static const Line row2 = Line._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'row2');
  static const Line column0 = Line._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'column0');
  static const Line column1 = Line._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'column1');
  static const Line column2 = Line._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'column2');
  static const Line from00 = Line._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'from00');
  static const Line from02 = Line._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'from02');

  static const $core.List<Line> values = <Line> [
    row0,
    row1,
    row2,
    column0,
    column1,
    column2,
    from00,
    from02,
  ];

  static final $core.Map<$core.int, Line> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Line? valueOf($core.int value) => _byValue[value];

  const Line._($core.int v, $core.String n) : super(v, n);
}

