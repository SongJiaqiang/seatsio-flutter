// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioObject> _$seatsioObjectSerializer =
    new _$SeatsioObjectSerializer();

class _$SeatsioObjectSerializer implements StructuredSerializer<SeatsioObject> {
  @override
  final Iterable<Type> types = const [SeatsioObject, _$SeatsioObject];
  @override
  final String wireName = 'SeatsioObject';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'objectType',
      serializers.serialize(object.objectType,
          specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'forSale',
      serializers.serialize(object.forSale,
          specifiedType: const FullType(bool)),
      'selectable',
      serializers.serialize(object.selectable,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.labelDetail;
    if (value != null) {
      result
        ..add('labels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SeatsioLabel)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SeatsioCategory)));
    }
    value = object.center;
    if (value != null) {
      result
        ..add('center')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SeatsioPoint)));
    }
    return result;
  }

  @override
  SeatsioObject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'objectType':
          result.objectType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'labels':
          result.labelDetail.replace(serializers.deserialize(value,
              specifiedType: const FullType(SeatsioLabel))! as SeatsioLabel);
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SeatsioCategory))!
              as SeatsioCategory);
          break;
        case 'center':
          result.center.replace(serializers.deserialize(value,
              specifiedType: const FullType(SeatsioPoint))! as SeatsioPoint);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'forSale':
          result.forSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'selectable':
          result.selectable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioObject extends SeatsioObject {
  @override
  final String id;
  @override
  final String uuid;
  @override
  final String objectType;
  @override
  final String label;
  @override
  final SeatsioLabel? labelDetail;
  @override
  final SeatsioCategory? category;
  @override
  final SeatsioPoint? center;
  @override
  final String status;
  @override
  final bool forSale;
  @override
  final bool selectable;

  factory _$SeatsioObject([void Function(SeatsioObjectBuilder)? updates]) =>
      (new SeatsioObjectBuilder()..update(updates)).build();

  _$SeatsioObject._(
      {required this.id,
      required this.uuid,
      required this.objectType,
      required this.label,
      this.labelDetail,
      this.category,
      this.center,
      required this.status,
      required this.forSale,
      required this.selectable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'SeatsioObject', 'id');
    BuiltValueNullFieldError.checkNotNull(uuid, 'SeatsioObject', 'uuid');
    BuiltValueNullFieldError.checkNotNull(
        objectType, 'SeatsioObject', 'objectType');
    BuiltValueNullFieldError.checkNotNull(label, 'SeatsioObject', 'label');
    BuiltValueNullFieldError.checkNotNull(status, 'SeatsioObject', 'status');
    BuiltValueNullFieldError.checkNotNull(forSale, 'SeatsioObject', 'forSale');
    BuiltValueNullFieldError.checkNotNull(
        selectable, 'SeatsioObject', 'selectable');
  }

  @override
  SeatsioObject rebuild(void Function(SeatsioObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioObjectBuilder toBuilder() => new SeatsioObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioObject &&
        id == other.id &&
        uuid == other.uuid &&
        objectType == other.objectType &&
        label == other.label &&
        labelDetail == other.labelDetail &&
        category == other.category &&
        center == other.center &&
        status == other.status &&
        forSale == other.forSale &&
        selectable == other.selectable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), uuid.hashCode),
                                    objectType.hashCode),
                                label.hashCode),
                            labelDetail.hashCode),
                        category.hashCode),
                    center.hashCode),
                status.hashCode),
            forSale.hashCode),
        selectable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SeatsioObject')
          ..add('id', id)
          ..add('uuid', uuid)
          ..add('objectType', objectType)
          ..add('label', label)
          ..add('labelDetail', labelDetail)
          ..add('category', category)
          ..add('center', center)
          ..add('status', status)
          ..add('forSale', forSale)
          ..add('selectable', selectable))
        .toString();
  }
}

class SeatsioObjectBuilder
    implements Builder<SeatsioObject, SeatsioObjectBuilder> {
  _$SeatsioObject? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _uuid;
  String? get uuid => _$this._uuid;
  set uuid(String? uuid) => _$this._uuid = uuid;

  String? _objectType;
  String? get objectType => _$this._objectType;
  set objectType(String? objectType) => _$this._objectType = objectType;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  SeatsioLabelBuilder? _labelDetail;
  SeatsioLabelBuilder get labelDetail =>
      _$this._labelDetail ??= new SeatsioLabelBuilder();
  set labelDetail(SeatsioLabelBuilder? labelDetail) =>
      _$this._labelDetail = labelDetail;

  SeatsioCategoryBuilder? _category;
  SeatsioCategoryBuilder get category =>
      _$this._category ??= new SeatsioCategoryBuilder();
  set category(SeatsioCategoryBuilder? category) => _$this._category = category;

  SeatsioPointBuilder? _center;
  SeatsioPointBuilder get center =>
      _$this._center ??= new SeatsioPointBuilder();
  set center(SeatsioPointBuilder? center) => _$this._center = center;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _forSale;
  bool? get forSale => _$this._forSale;
  set forSale(bool? forSale) => _$this._forSale = forSale;

  bool? _selectable;
  bool? get selectable => _$this._selectable;
  set selectable(bool? selectable) => _$this._selectable = selectable;

  SeatsioObjectBuilder();

  SeatsioObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _uuid = $v.uuid;
      _objectType = $v.objectType;
      _label = $v.label;
      _labelDetail = $v.labelDetail?.toBuilder();
      _category = $v.category?.toBuilder();
      _center = $v.center?.toBuilder();
      _status = $v.status;
      _forSale = $v.forSale;
      _selectable = $v.selectable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioObject;
  }

  @override
  void update(void Function(SeatsioObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SeatsioObject build() {
    _$SeatsioObject _$result;
    try {
      _$result = _$v ??
          new _$SeatsioObject._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'SeatsioObject', 'id'),
              uuid: BuiltValueNullFieldError.checkNotNull(
                  uuid, 'SeatsioObject', 'uuid'),
              objectType: BuiltValueNullFieldError.checkNotNull(
                  objectType, 'SeatsioObject', 'objectType'),
              label: BuiltValueNullFieldError.checkNotNull(
                  label, 'SeatsioObject', 'label'),
              labelDetail: _labelDetail?.build(),
              category: _category?.build(),
              center: _center?.build(),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, 'SeatsioObject', 'status'),
              forSale: BuiltValueNullFieldError.checkNotNull(
                  forSale, 'SeatsioObject', 'forSale'),
              selectable: BuiltValueNullFieldError.checkNotNull(
                  selectable, 'SeatsioObject', 'selectable'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'labelDetail';
        _labelDetail?.build();
        _$failedField = 'category';
        _category?.build();
        _$failedField = 'center';
        _center?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SeatsioObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
