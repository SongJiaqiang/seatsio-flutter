import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pricing_for_category.g.dart';

abstract class PricingForCategory
    implements Built<PricingForCategory, PricingForCategoryBuilder> {
  const PricingForCategory._();

  factory PricingForCategory([updates(PricingForCategoryBuilder b)]) =
      _$PricingForCategory;

  int? get categoryKey;

  @JsonKey()
  String? get category;

  num? get price;

  BuiltList<TicketTypePricing>? get ticketTypes;

  static PricingForCategory? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data != null) {
      return PricingForCategory.fromMap(data);
    }
    return null;
  }

  static PricingForCategory? fromMap(Map? data) {
    if (data == null) {
      return null;
    }
    // todo(sjq):当前pricing数据为空，以下代码待验证
    return PricingForCategory((b) => b
      ..categoryKey = data["categoryKey"]
      ..category = data["category"]
      ..price = data["price"]
      ..ticketTypes =
          TicketTypePricing.arrayFromJson(data["ticketTypes"])?.toBuilder());
  }

  static Serializer<PricingForCategory> get serializer =>
      _$pricingForCategorySerializer;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'category': categoryKey ?? category, 'price': price};
}

abstract class TicketTypePricing
    implements Built<TicketTypePricing, TicketTypePricingBuilder> {
  TicketTypePricing._();

  factory TicketTypePricing([updates(TicketTypePricingBuilder b)]) =
      _$TicketTypePricing;

  String? get ticketType;

  num? get price;

  String? get label;

  static TicketTypePricing? fromMap(Map<String, dynamic>? data) {
    if (data != null) {
      return TicketTypePricing((b) => b
        ..ticketType = data["ticketType"]
        ..price = data["price"]
        ..label = data["label"]);
    }
    return null;
  }

  static BuiltList<TicketTypePricing>? arrayFromJson(String? jsonString) {
    final data = jsonString != null ? json.decode(jsonString) : null;
    if (data != null && data is List) {
      final List<TicketTypePricing> objects = [];
      data.forEach((e) {
        final object = TicketTypePricing.fromMap(e);
        if (object != null) {
          objects.add(object);
        }
      });
      return objects.toBuiltList();
    }
    return null;
  }

  static Serializer<TicketTypePricing> get serializer =>
      _$ticketTypePricingSerializer;
}
