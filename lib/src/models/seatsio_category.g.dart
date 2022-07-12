// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioCategory> _$seatsioCategorySerializer =
    new _$SeatsioCategorySerializer();

class _$SeatsioCategorySerializer
    implements StructuredSerializer<SeatsioCategory> {
  @override
  final Iterable<Type> types = const [SeatsioCategory, _$SeatsioCategory];
  @override
  final String wireName = 'SeatsioCategory';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.label;
    if (value != null) {
      result
        ..add('label')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pricing;
    if (value != null) {
      result
        ..add('pricing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PricingForCategory)));
    }
    value = object.accessible;
    if (value != null) {
      result
        ..add('accessible')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFiltered;
    if (value != null) {
      result
        ..add('isFiltered')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SeatsioCategory deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pricing':
          result.pricing.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PricingForCategory))!
              as PricingForCategory);
          break;
        case 'accessible':
          result.accessible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isFiltered':
          result.isFiltered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioCategory extends SeatsioCategory {
  @override
  final String key;
  @override
  final String? label;
  @override
  final String? color;
  @override
  final PricingForCategory? pricing;
  @override
  final bool? accessible;
  @override
  final bool? isFiltered;

  factory _$SeatsioCategory([void Function(SeatsioCategoryBuilder)? updates]) =>
      (new SeatsioCategoryBuilder()..update(updates))._build();

  _$SeatsioCategory._(
      {required this.key,
      this.label,
      this.color,
      this.pricing,
      this.accessible,
      this.isFiltered})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(key, r'SeatsioCategory', 'key');
  }

  @override
  SeatsioCategory rebuild(void Function(SeatsioCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioCategoryBuilder toBuilder() =>
      new SeatsioCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioCategory &&
        key == other.key &&
        label == other.label &&
        color == other.color &&
        pricing == other.pricing &&
        accessible == other.accessible &&
        isFiltered == other.isFiltered;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, key.hashCode), label.hashCode), color.hashCode),
                pricing.hashCode),
            accessible.hashCode),
        isFiltered.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeatsioCategory')
          ..add('key', key)
          ..add('label', label)
          ..add('color', color)
          ..add('pricing', pricing)
          ..add('accessible', accessible)
          ..add('isFiltered', isFiltered))
        .toString();
  }
}

class SeatsioCategoryBuilder
    implements Builder<SeatsioCategory, SeatsioCategoryBuilder> {
  _$SeatsioCategory? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  PricingForCategoryBuilder? _pricing;
  PricingForCategoryBuilder get pricing =>
      _$this._pricing ??= new PricingForCategoryBuilder();
  set pricing(PricingForCategoryBuilder? pricing) => _$this._pricing = pricing;

  bool? _accessible;
  bool? get accessible => _$this._accessible;
  set accessible(bool? accessible) => _$this._accessible = accessible;

  bool? _isFiltered;
  bool? get isFiltered => _$this._isFiltered;
  set isFiltered(bool? isFiltered) => _$this._isFiltered = isFiltered;

  SeatsioCategoryBuilder();

  SeatsioCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _label = $v.label;
      _color = $v.color;
      _pricing = $v.pricing?.toBuilder();
      _accessible = $v.accessible;
      _isFiltered = $v.isFiltered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioCategory;
  }

  @override
  void update(void Function(SeatsioCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeatsioCategory build() => _build();

  _$SeatsioCategory _build() {
    _$SeatsioCategory _$result;
    try {
      _$result = _$v ??
          new _$SeatsioCategory._(
              key: BuiltValueNullFieldError.checkNotNull(
                  key, r'SeatsioCategory', 'key'),
              label: label,
              color: color,
              pricing: _pricing?.build(),
              accessible: accessible,
              isFiltered: isFiltered);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pricing';
        _pricing?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SeatsioCategory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
