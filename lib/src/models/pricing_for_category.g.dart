// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_for_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PricingForCategory> _$pricingForCategorySerializer =
    new _$PricingForCategorySerializer();
Serializer<TicketTypePricing> _$ticketTypePricingSerializer =
    new _$TicketTypePricingSerializer();

class _$PricingForCategorySerializer
    implements StructuredSerializer<PricingForCategory> {
  @override
  final Iterable<Type> types = const [PricingForCategory, _$PricingForCategory];
  @override
  final String wireName = 'PricingForCategory';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PricingForCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.ticketTypes;
    if (value != null) {
      result
        ..add('ticketTypes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TicketTypePricing)])));
    }
    return result;
  }

  @override
  PricingForCategory deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PricingForCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ticketTypes':
          result.ticketTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TicketTypePricing)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TicketTypePricingSerializer
    implements StructuredSerializer<TicketTypePricing> {
  @override
  final Iterable<Type> types = const [TicketTypePricing, _$TicketTypePricing];
  @override
  final String wireName = 'TicketTypePricing';

  @override
  Iterable<Object?> serialize(Serializers serializers, TicketTypePricing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ticketType;
    if (value != null) {
      result
        ..add('ticketType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.label;
    if (value != null) {
      result
        ..add('label')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TicketTypePricing deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TicketTypePricingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ticketType':
          result.ticketType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PricingForCategory extends PricingForCategory {
  @override
  final String category;
  @override
  final double price;
  @override
  final BuiltList<TicketTypePricing>? ticketTypes;

  factory _$PricingForCategory(
          [void Function(PricingForCategoryBuilder)? updates]) =>
      (new PricingForCategoryBuilder()..update(updates)).build();

  _$PricingForCategory._(
      {required this.category, required this.price, this.ticketTypes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category, 'PricingForCategory', 'category');
    BuiltValueNullFieldError.checkNotNull(price, 'PricingForCategory', 'price');
  }

  @override
  PricingForCategory rebuild(
          void Function(PricingForCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricingForCategoryBuilder toBuilder() =>
      new PricingForCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricingForCategory &&
        category == other.category &&
        price == other.price &&
        ticketTypes == other.ticketTypes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, category.hashCode), price.hashCode), ticketTypes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PricingForCategory')
          ..add('category', category)
          ..add('price', price)
          ..add('ticketTypes', ticketTypes))
        .toString();
  }
}

class PricingForCategoryBuilder
    implements Builder<PricingForCategory, PricingForCategoryBuilder> {
  _$PricingForCategory? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  ListBuilder<TicketTypePricing>? _ticketTypes;
  ListBuilder<TicketTypePricing> get ticketTypes =>
      _$this._ticketTypes ??= new ListBuilder<TicketTypePricing>();
  set ticketTypes(ListBuilder<TicketTypePricing>? ticketTypes) =>
      _$this._ticketTypes = ticketTypes;

  PricingForCategoryBuilder();

  PricingForCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _price = $v.price;
      _ticketTypes = $v.ticketTypes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricingForCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PricingForCategory;
  }

  @override
  void update(void Function(PricingForCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PricingForCategory build() {
    _$PricingForCategory _$result;
    try {
      _$result = _$v ??
          new _$PricingForCategory._(
              category: BuiltValueNullFieldError.checkNotNull(
                  category, 'PricingForCategory', 'category'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, 'PricingForCategory', 'price'),
              ticketTypes: _ticketTypes?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ticketTypes';
        _ticketTypes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PricingForCategory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TicketTypePricing extends TicketTypePricing {
  @override
  final String? ticketType;
  @override
  final double? price;
  @override
  final String? label;

  factory _$TicketTypePricing(
          [void Function(TicketTypePricingBuilder)? updates]) =>
      (new TicketTypePricingBuilder()..update(updates)).build();

  _$TicketTypePricing._({this.ticketType, this.price, this.label}) : super._();

  @override
  TicketTypePricing rebuild(void Function(TicketTypePricingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TicketTypePricingBuilder toBuilder() =>
      new TicketTypePricingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TicketTypePricing &&
        ticketType == other.ticketType &&
        price == other.price &&
        label == other.label;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, ticketType.hashCode), price.hashCode), label.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TicketTypePricing')
          ..add('ticketType', ticketType)
          ..add('price', price)
          ..add('label', label))
        .toString();
  }
}

class TicketTypePricingBuilder
    implements Builder<TicketTypePricing, TicketTypePricingBuilder> {
  _$TicketTypePricing? _$v;

  String? _ticketType;
  String? get ticketType => _$this._ticketType;
  set ticketType(String? ticketType) => _$this._ticketType = ticketType;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  TicketTypePricingBuilder();

  TicketTypePricingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ticketType = $v.ticketType;
      _price = $v.price;
      _label = $v.label;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TicketTypePricing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TicketTypePricing;
  }

  @override
  void update(void Function(TicketTypePricingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TicketTypePricing build() {
    final _$result = _$v ??
        new _$TicketTypePricing._(
            ticketType: ticketType, price: price, label: label);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
