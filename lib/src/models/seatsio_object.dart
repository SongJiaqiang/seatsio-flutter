import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'seatsio_category.dart';
import 'seatsio_label.dart';
import 'seatsio_point.dart';

part 'seatsio_object.g.dart';

abstract class SeatsioObject
    implements Built<SeatsioObject, SeatsioObjectBuilder> {
  const SeatsioObject._();

  factory SeatsioObject([updates(SeatsioObjectBuilder b)]) = _$SeatsioObject;

  String get id;

  String get uuid;

  String get objectType;

  String get label;

  @BuiltValueField(wireName: 'labels')
  SeatsioLabel? get labelDetail;

  SeatsioCategory? get category;

  SeatsioPoint? get center;

  String get status;

  bool get forSale;

  bool get selectable;

  List<SeatsioObject>? get seats;

  static SeatsioObject? fromMap(Map? data) {
    if (data == null) {
      return null;
    }

    if (data['objectType'] == 'Table') {
      data['labels'].addAll({'parent': 'table'});
    }

    if (data['seats'] != null) {
      for (int i = 0; i < data['seats'].length; i++) {
        data['seats'][i].addAll(
          {
            'category': data['category'],
            'status': data['status'],
            'forSale': data['forSale'],
            'selectable': data['selectable'],
          },
        );
      }
    }

    return SeatsioObject(
      (b) => b
        ..id = data["id"]
        ..label = data["label"]
        ..uuid = data["uuid"]
        ..objectType = data["objectType"]
        ..labelDetail = SeatsioLabel.fromMap(data["labels"])!.toBuilder()
        ..category = SeatsioCategory.fromMap(data["category"])!.toBuilder()
        ..center = SeatsioPoint.fromMap(data["center"])!.toBuilder()
        ..status = data["status"] ?? ''
        ..forSale = data["forSale"]
        ..selectable = data["selectable"]
        ..seats = data['seats'] != null
            ? List<SeatsioObject>.from(
                data['seats']?.map((x) => SeatsioObject.fromMap(x)))
            : null,
    );
  }

  static SeatsioObject? fromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data == null) {
      return null;
    }
    return fromMap(data);
  }

  static List<SeatsioObject>? arrayFromJson(String jsonString) {
    final data = json.decode(jsonString);
    if (data is List) {
      final List<SeatsioObject> objects = [];
      data.forEach((e) {
        final object = fromMap(e);
        if (object != null) {
          objects.add(object);
        }
      });
      return objects;
    }
    return null;
  }

  static Serializer<SeatsioObject> get serializer => _$seatsioObjectSerializer;
}
