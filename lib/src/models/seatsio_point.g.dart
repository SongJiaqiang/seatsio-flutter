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
      serializers.serialize(object.x, specifiedType: const FullType(num)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(num)),
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
              specifiedType: const FullType(num))! as num;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(num))! as num;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioPoint extends SeatsioPoint {
  @override
  final num x;
  @override
  final num y;

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
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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

  num? _x;
  num? get x => _$this._x;
  set x(num? x) => _$this._x = x;

  num? _y;
  num? get y => _$this._y;
  set y(num? y) => _$this._y = y;

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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
