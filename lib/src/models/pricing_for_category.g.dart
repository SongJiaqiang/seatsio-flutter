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
    final result = <Object?>[];
    Object? value;
    value = object.categoryKey;
    if (value != null) {
      result
        ..add('categoryKey')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
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
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categoryKey':
          result.categoryKey = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
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
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
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
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ticketType':
          result.ticketType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
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
  final int? categoryKey;
  @override
  final String? category;
  @override
  final num? price;
  @override
  final BuiltList<TicketTypePricing>? ticketTypes;

  factory _$PricingForCategory(
          [void Function(PricingForCategoryBuilder)? updates]) =>
      (new PricingForCategoryBuilder()..update(updates))._build();

  _$PricingForCategory._(
      {this.categoryKey, this.category, this.price, this.ticketTypes})
      : super._();

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
        categoryKey == other.categoryKey &&
        category == other.category &&
        price == other.price &&
        ticketTypes == other.ticketTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryKey.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, ticketTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PricingForCategory')
          ..add('categoryKey', categoryKey)
          ..add('category', category)
          ..add('price', price)
          ..add('ticketTypes', ticketTypes))
        .toString();
  }
}

class PricingForCategoryBuilder
    implements Builder<PricingForCategory, PricingForCategoryBuilder> {
  _$PricingForCategory? _$v;

  int? _categoryKey;
  int? get categoryKey => _$this._categoryKey;
  set categoryKey(int? categoryKey) => _$this._categoryKey = categoryKey;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

  ListBuilder<TicketTypePricing>? _ticketTypes;
  ListBuilder<TicketTypePricing> get ticketTypes =>
      _$this._ticketTypes ??= new ListBuilder<TicketTypePricing>();
  set ticketTypes(ListBuilder<TicketTypePricing>? ticketTypes) =>
      _$this._ticketTypes = ticketTypes;

  PricingForCategoryBuilder();

  PricingForCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryKey = $v.categoryKey;
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
  PricingForCategory build() => _build();

  _$PricingForCategory _build() {
    _$PricingForCategory _$result;
    try {
      _$result = _$v ??
          new _$PricingForCategory._(
              categoryKey: categoryKey,
              category: category,
              price: price,
              ticketTypes: _ticketTypes?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ticketTypes';
        _ticketTypes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PricingForCategory', _$failedField, e.toString());
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
  final num? price;
  @override
  final String? label;

  factory _$TicketTypePricing(
          [void Function(TicketTypePricingBuilder)? updates]) =>
      (new TicketTypePricingBuilder()..update(updates))._build();

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
    var _$hash = 0;
    _$hash = $jc(_$hash, ticketType.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TicketTypePricing')
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

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

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
  TicketTypePricing build() => _build();

  _$TicketTypePricing _build() {
    final _$result = _$v ??
        new _$TicketTypePricing._(
            ticketType: ticketType, price: price, label: label);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
