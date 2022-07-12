// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_point.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioPoint> _$seatsioPointSerializer =
    new _$SeatsioPointSerializer();

class _$SeatsioPointSerializer implements StructuredSerializer<SeatsioPoint> {
  @override
  final Iterable<Type> types = const [SeatsioPoint, _$SeatsioPoint];
  @override
  final String wireName = 'SeatsioPoint';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioPoint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(double)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  SeatsioPoint deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioPointBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'x':
          result.x = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioPoint extends SeatsioPoint {
  @override
  final double x;
  @override
  final double y;

  factory _$SeatsioPoint([void Function(SeatsioPointBuilder)? updates]) =>
      (new SeatsioPointBuilder()..update(updates))._build();

  _$SeatsioPoint._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'SeatsioPoint', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'SeatsioPoint', 'y');
  }

  @override
  SeatsioPoint rebuild(void Function(SeatsioPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioPointBuilder toBuilder() => new SeatsioPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioPoint && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeatsioPoint')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class SeatsioPointBuilder
    implements Builder<SeatsioPoint, SeatsioPointBuilder> {
  _$SeatsioPoint? _$v;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  SeatsioPointBuilder();

  SeatsioPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioPoint;
  }

  @override
  void update(void Function(SeatsioPointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeatsioPoint build() => _build();

  _$SeatsioPoint _build() {
    final _$result = _$v ??
        new _$SeatsioPoint._(
            x: BuiltValueNullFieldError.checkNotNull(x, r'SeatsioPoint', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'SeatsioPoint', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
