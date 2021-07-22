///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use lineDescriptor instead')
const Line$json = const {
  '1': 'Line',
  '2': const [
    const {'1': 'row0', '2': 0},
    const {'1': 'row1', '2': 1},
    const {'1': 'row2', '2': 2},
    const {'1': 'column0', '2': 3},
    const {'1': 'column1', '2': 4},
    const {'1': 'column2', '2': 5},
    const {'1': 'from00', '2': 6},
    const {'1': 'from02', '2': 7},
  ],
};

/// Descriptor for `Line`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List lineDescriptor = $convert.base64Decode('CgRMaW5lEggKBHJvdzAQABIICgRyb3cxEAESCAoEcm93MhACEgsKB2NvbHVtbjAQAxILCgdjb2x1bW4xEAQSCwoHY29sdW1uMhAFEgoKBmZyb20wMBAGEgoKBmZyb20wMhAH');
@$core.Deprecated('Use choosePositionDescriptor instead')
const ChoosePosition$json = const {
  '1': 'ChoosePosition',
  '2': const [
    const {'1': 'position', '3': 1, '4': 1, '5': 5, '10': 'position'},
    const {'1': 'e', '3': 2, '4': 1, '5': 1, '10': 'e'},
  ],
};

/// Descriptor for `ChoosePosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List choosePositionDescriptor = $convert.base64Decode('Cg5DaG9vc2VQb3NpdGlvbhIaCghwb3NpdGlvbhgBIAEoBVIIcG9zaXRpb24SDAoBZRgCIAEoAVIBZQ==');
@$core.Deprecated('Use chooseLineDescriptor instead')
const ChooseLine$json = const {
  '1': 'ChooseLine',
  '2': const [
    const {'1': 'line', '3': 1, '4': 1, '5': 14, '6': '.Line', '10': 'line'},
    const {'1': 'e', '3': 2, '4': 1, '5': 1, '10': 'e'},
  ],
};

/// Descriptor for `ChooseLine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chooseLineDescriptor = $convert.base64Decode('CgpDaG9vc2VMaW5lEhkKBGxpbmUYASABKA4yBS5MaW5lUgRsaW5lEgwKAWUYAiABKAFSAWU=');
@$core.Deprecated('Use chooseCacheDescriptor instead')
const ChooseCache$json = const {
  '1': 'ChooseCache',
  '2': const [
    const {'1': 'positions', '3': 1, '4': 3, '5': 11, '6': '.ChooseCache.PositionsEntry', '10': 'positions'},
    const {'1': 'lines', '3': 2, '4': 3, '5': 11, '6': '.ChooseCache.LinesEntry', '10': 'lines'},
  ],
  '3': const [ChooseCache_PositionsEntry$json, ChooseCache_LinesEntry$json],
};

@$core.Deprecated('Use chooseCacheDescriptor instead')
const ChooseCache_PositionsEntry$json = const {
  '1': 'PositionsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.ChoosePosition', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use chooseCacheDescriptor instead')
const ChooseCache_LinesEntry$json = const {
  '1': 'LinesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.ChooseLine', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ChooseCache`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chooseCacheDescriptor = $convert.base64Decode('CgtDaG9vc2VDYWNoZRI5Cglwb3NpdGlvbnMYASADKAsyGy5DaG9vc2VDYWNoZS5Qb3NpdGlvbnNFbnRyeVIJcG9zaXRpb25zEi0KBWxpbmVzGAIgAygLMhcuQ2hvb3NlQ2FjaGUuTGluZXNFbnRyeVIFbGluZXMaTQoOUG9zaXRpb25zRW50cnkSEAoDa2V5GAEgASgFUgNrZXkSJQoFdmFsdWUYAiABKAsyDy5DaG9vc2VQb3NpdGlvblIFdmFsdWU6AjgBGkUKCkxpbmVzRW50cnkSEAoDa2V5GAEgASgFUgNrZXkSIQoFdmFsdWUYAiABKAsyCy5DaG9vc2VMaW5lUgV2YWx1ZToCOAE=');
