import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seatsio_label.g.dart';

abstract class SeatsioLabel
    implements Built<SeatsioLabel, SeatsioLabelBuilder> {
  const SeatsioLabel._();

  factory SeatsioLabel([updates(SeatsioLabelBuilder b)]) = _$SeatsioLabel;

  String? get own;

  String? get parent;

  String? get section;

  String? get displayedLabel;

  static SeatsioLabel? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null) {
      return SeatsioLabel.fromMap(data);
    }
    return null;
  }

  // todo(sjq): 建议设置成可选参数和可空结果
  static SeatsioLabel? fromMap(Map? data) {
    if (data != null) {
      return SeatsioLabel((b) => b
        ..own = data["own"]
        ..parent = data["parent"]
        ..section = data["section"]
        ..displayedLabel = data["displayedLabel"]);
    }
    return null;
  }

  static Serializer<SeatsioLabel> get serializer => _$seatsioLabelSerializer;
}
