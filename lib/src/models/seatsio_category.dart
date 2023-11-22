import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'pricing_for_category.dart';

part 'seatsio_category.g.dart';

abstract class SeatsioCategory
    implements Built<SeatsioCategory, SeatsioCategoryBuilder> {
  const SeatsioCategory._();

  factory SeatsioCategory([updates(SeatsioCategoryBuilder b)]) =
      _$SeatsioCategory;

  String get key;

  String? get label;

  String? get color;

  PricingForCategory? get pricing;

  bool? get accessible;

  bool? get isFiltered;

  static SeatsioCategory? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null) {
      return SeatsioCategory.fromMap(data);
    }
    return null;
  }

  static SeatsioCategory? fromMap(Map? data) {
    if (data == null) {
      return null;
    }

    return SeatsioCategory((b) => b
      ..key = data["key"].toString()
      ..label = data["label"]
      ..color = data["color"]
      ..pricing = PricingForCategory.fromMap(data["pricing"])?.toBuilder()
      ..accessible = data["accessible"]
      ..isFiltered = data["isFiltered"]);
  }

  static BuiltList<SeatsioCategory>? arrayFromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null && data is List) {
      final List<SeatsioCategory> objects = [];
      data.forEach((e) {
        final object = SeatsioCategory.fromMap(e);
        if (object != null) {
          objects.add(object);
        }
      });
      return objects.toBuiltList();
    }
    return null;
  }

  static Serializer<SeatsioCategory> get serializer =>
      _$seatsioCategorySerializer;
}
