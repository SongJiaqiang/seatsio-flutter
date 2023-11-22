import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seating_config_change.g.dart';

abstract class SeatingConfigChange
    implements Built<SeatingConfigChange, SeatingConfigChangeBuilder> {
  const SeatingConfigChange._();

  factory SeatingConfigChange([updates(SeatingConfigChangeBuilder b)]) =
      _$SeatingConfigChange;

  String? get objectColor;

  String? get objectLabel;

  String? get objectIcon;

  /// See more: https://docs.seats.io/docs/renderer/config-maxselectedobjects/
  int? get maxSelectedObjects;

  /// If [maxSelectedObjectList] is not null, it replaces [maxSelectedObjectList].
  List<Map<String, dynamic>>? get maxSelectedObjectList;

  BuiltMap<String, String>? get extraConfig;

  /// See more: https://docs.seats.io/docs/renderer/availablecategories/
  BuiltList<String>? get availableCategories;

  BuiltList<String>? get unavailableCategories;

  BuiltList<String>? get filteredCategories;

  Map<String, Object?> toMap() {
    final Map<String, Object?> configMap = {};

    if (objectColor != null) {
      configMap["objectColor"] = objectColor;
    }

    if (objectIcon != null) {
      configMap["objectIcon"] = objectIcon;
    }

    if (objectLabel != null) {
      configMap["objectLabel"] = objectLabel;
    }

    if (maxSelectedObjectList != null) {
      configMap["maxSelectedObjects"] = maxSelectedObjectList;
    } else if (maxSelectedObjects != null) {
      configMap["maxSelectedObjects"] = maxSelectedObjects;
    }

    if (extraConfig != null) {
      configMap["extraConfig"] = extraConfig!.toMap();
    }

    if (availableCategories != null && availableCategories!.isNotEmpty) {
      configMap["availableCategories"] = availableCategories!.toList();
    }

    if (unavailableCategories != null && unavailableCategories!.isNotEmpty) {
      configMap["unavailableCategories"] = unavailableCategories!.toList();
    }

    if (filteredCategories != null && filteredCategories!.isNotEmpty) {
      configMap["filteredCategories"] = filteredCategories!.toList();
    }

    return configMap;
  }

  static Serializer<SeatingConfigChange> get serializer =>
      _$seatingConfigChangeSerializer;
}
