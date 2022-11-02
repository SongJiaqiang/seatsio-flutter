// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_ticket_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioTicketType> _$seatsioTicketTypeSerializer =
    new _$SeatsioTicketTypeSerializer();

class _$SeatsioTicketTypeSerializer
    implements StructuredSerializer<SeatsioTicketType> {
  @override
  final Iterable<Type> types = const [SeatsioTicketType, _$SeatsioTicketType];
  @override
  final String wireName = 'SeatsioTicketType';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioTicketType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'ticketType',
      serializers.serialize(object.ticketType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SeatsioTicketType deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioTicketTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ticketType':
          result.ticketType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioTicketType extends SeatsioTicketType {
  @override
  final double price;
  @override
  final String ticketType;

  factory _$SeatsioTicketType(
          [void Function(SeatsioTicketTypeBuilder)? updates]) =>
      (new SeatsioTicketTypeBuilder()..update(updates)).build();

  _$SeatsioTicketType._({required this.price, required this.ticketType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(price, 'SeatsioTicketType', 'price');
    BuiltValueNullFieldError.checkNotNull(
        ticketType, 'SeatsioTicketType', 'ticketType');
  }

  @override
  SeatsioTicketType rebuild(void Function(SeatsioTicketTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioTicketTypeBuilder toBuilder() =>
      new SeatsioTicketTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioTicketType &&
        price == other.price &&
        ticketType == other.ticketType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, price.hashCode), ticketType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SeatsioTicketType')
          ..add('price', price)
          ..add('ticketType', ticketType))
        .toString();
  }
}

class SeatsioTicketTypeBuilder
    implements Builder<SeatsioTicketType, SeatsioTicketTypeBuilder> {
  _$SeatsioTicketType? _$v;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _ticketType;
  String? get ticketType => _$this._ticketType;
  set ticketType(String? ticketType) => _$this._ticketType = ticketType;

  SeatsioTicketTypeBuilder();

  SeatsioTicketTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _ticketType = $v.ticketType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioTicketType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioTicketType;
  }

  @override
  void update(void Function(SeatsioTicketTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SeatsioTicketType build() {
    final _$result = _$v ??
        new _$SeatsioTicketType._(
            price: BuiltValueNullFieldError.checkNotNull(
                price, 'SeatsioTicketType', 'price'),
            ticketType: BuiltValueNullFieldError.checkNotNull(
                ticketType, 'SeatsioTicketType', 'ticketType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
