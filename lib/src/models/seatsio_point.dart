import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seatsio_point.g.dart';

abstract class SeatsioPoint
    implements Built<SeatsioPoint, SeatsioPointBuilder> {
  const SeatsioPoint._();

  factory SeatsioPoint([updates(SeatsioPointBuilder b)]) = _$SeatsioPoint;

  num get x;

  num get y;

  static SeatsioPoint? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null) {
      return SeatsioPoint.fromMap(data);
    }
    return null;
  }

  static SeatsioPoint? fromMap(Map? data) {
    if (data == null) {
      return null;
    }
    return SeatsioPoint((b) => b
      ..x = data["x"]
      ..y = data["y"]);
  }

  static Serializer<SeatsioPoint> get serializer => _$seatsioPointSerializer;
}
