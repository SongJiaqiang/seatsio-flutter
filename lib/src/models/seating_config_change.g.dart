// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seating_config_change.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatingConfigChange> _$seatingConfigChangeSerializer =
    new _$SeatingConfigChangeSerializer();

class _$SeatingConfigChangeSerializer
    implements StructuredSerializer<SeatingConfigChange> {
  @override
  final Iterable<Type> types = const [
    SeatingConfigChange,
    _$SeatingConfigChange
  ];
  @override
  final String wireName = 'SeatingConfigChange';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SeatingConfigChange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.objectColor;
    if (value != null) {
      result
        ..add('objectColor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.objectLabel;
    if (value != null) {
      result
        ..add('objectLabel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.objectIcon;
    if (value != null) {
      result
        ..add('objectIcon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxSelectedObjects;
    if (value != null) {
      result
        ..add('maxSelectedObjects')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.extraConfig;
    if (value != null) {
      result
        ..add('extraConfig')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(String)])));
    }
    value = object.availableCategories;
    if (value != null) {
      result
        ..add('availableCategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.unavailableCategories;
    if (value != null) {
      result
        ..add('unavailableCategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.filteredCategories;
    if (value != null) {
      result
        ..add('filteredCategories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  SeatingConfigChange deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatingConfigChangeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'objectColor':
          result.objectColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'objectLabel':
          result.objectLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'objectIcon':
          result.objectIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maxSelectedObjects':
          result.maxSelectedObjects = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'extraConfig':
          result.extraConfig.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)]))!);
          break;
        case 'availableCategories':
          result.availableCategories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'unavailableCategories':
          result.unavailableCategories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'filteredCategories':
          result.filteredCategories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SeatingConfigChange extends SeatingConfigChange {
  @override
  final String? objectColor;
  @override
  final String? objectLabel;
  @override
  final String? objectIcon;
  @override
  final int? maxSelectedObjects;
  @override
  final BuiltMap<String, String>? extraConfig;
  @override
  final BuiltList<String>? availableCategories;
  @override
  final BuiltList<String>? unavailableCategories;
  @override
  final BuiltList<String>? filteredCategories;

  factory _$SeatingConfigChange(
          [void Function(SeatingConfigChangeBuilder)? updates]) =>
      (new SeatingConfigChangeBuilder()..update(updates))._build();

  _$SeatingConfigChange._(
      {this.objectColor,
      this.objectLabel,
      this.objectIcon,
      this.maxSelectedObjects,
      this.extraConfig,
      this.availableCategories,
      this.unavailableCategories,
      this.filteredCategories})
      : super._();

  @override
  SeatingConfigChange rebuild(
          void Function(SeatingConfigChangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatingConfigChangeBuilder toBuilder() =>
      new SeatingConfigChangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatingConfigChange &&
        objectColor == other.objectColor &&
        objectLabel == other.objectLabel &&
        objectIcon == other.objectIcon &&
        maxSelectedObjects == other.maxSelectedObjects &&
        extraConfig == other.extraConfig &&
        availableCategories == other.availableCategories &&
        unavailableCategories == other.unavailableCategories &&
        filteredCategories == other.filteredCategories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, objectColor.hashCode);
    _$hash = $jc(_$hash, objectLabel.hashCode);
    _$hash = $jc(_$hash, objectIcon.hashCode);
    _$hash = $jc(_$hash, maxSelectedObjects.hashCode);
    _$hash = $jc(_$hash, extraConfig.hashCode);
    _$hash = $jc(_$hash, availableCategories.hashCode);
    _$hash = $jc(_$hash, unavailableCategories.hashCode);
    _$hash = $jc(_$hash, filteredCategories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeatingConfigChange')
          ..add('objectColor', objectColor)
          ..add('objectLabel', objectLabel)
          ..add('objectIcon', objectIcon)
          ..add('maxSelectedObjects', maxSelectedObjects)
          ..add('extraConfig', extraConfig)
          ..add('availableCategories', availableCategories)
          ..add('unavailableCategories', unavailableCategories)
          ..add('filteredCategories', filteredCategories))
        .toString();
  }
}

class SeatingConfigChangeBuilder
    implements Builder<SeatingConfigChange, SeatingConfigChangeBuilder> {
  _$SeatingConfigChange? _$v;

  String? _objectColor;
  String? get objectColor => _$this._objectColor;
  set objectColor(String? objectColor) => _$this._objectColor = objectColor;

  String? _objectLabel;
  String? get objectLabel => _$this._objectLabel;
  set objectLabel(String? objectLabel) => _$this._objectLabel = objectLabel;

  String? _objectIcon;
  String? get objectIcon => _$this._objectIcon;
  set objectIcon(String? objectIcon) => _$this._objectIcon = objectIcon;

  int? _maxSelectedObjects;
  int? get maxSelectedObjects => _$this._maxSelectedObjects;
  set maxSelectedObjects(int? maxSelectedObjects) =>
      _$this._maxSelectedObjects = maxSelectedObjects;

  MapBuilder<String, String>? _extraConfig;
  MapBuilder<String, String> get extraConfig =>
      _$this._extraConfig ??= new MapBuilder<String, String>();
  set extraConfig(MapBuilder<String, String>? extraConfig) =>
      _$this._extraConfig = extraConfig;

  ListBuilder<String>? _availableCategories;
  ListBuilder<String> get availableCategories =>
      _$this._availableCategories ??= new ListBuilder<String>();
  set availableCategories(ListBuilder<String>? availableCategories) =>
      _$this._availableCategories = availableCategories;

  ListBuilder<String>? _unavailableCategories;
  ListBuilder<String> get unavailableCategories =>
      _$this._unavailableCategories ??= new ListBuilder<String>();
  set unavailableCategories(ListBuilder<String>? unavailableCategories) =>
      _$this._unavailableCategories = unavailableCategories;

  ListBuilder<String>? _filteredCategories;
  ListBuilder<String> get filteredCategories =>
      _$this._filteredCategories ??= new ListBuilder<String>();
  set filteredCategories(ListBuilder<String>? filteredCategories) =>
      _$this._filteredCategories = filteredCategories;

  SeatingConfigChangeBuilder();

  SeatingConfigChangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _objectColor = $v.objectColor;
      _objectLabel = $v.objectLabel;
      _objectIcon = $v.objectIcon;
      _maxSelectedObjects = $v.maxSelectedObjects;
      _extraConfig = $v.extraConfig?.toBuilder();
      _availableCategories = $v.availableCategories?.toBuilder();
      _unavailableCategories = $v.unavailableCategories?.toBuilder();
      _filteredCategories = $v.filteredCategories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatingConfigChange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatingConfigChange;
  }

  @override
  void update(void Function(SeatingConfigChangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeatingConfigChange build() => _build();

  _$SeatingConfigChange _build() {
    _$SeatingConfigChange _$result;
    try {
      _$result = _$v ??
          new _$SeatingConfigChange._(
              objectColor: objectColor,
              objectLabel: objectLabel,
              objectIcon: objectIcon,
              maxSelectedObjects: maxSelectedObjects,
              extraConfig: _extraConfig?.build(),
              availableCategories: _availableCategories?.build(),
              unavailableCategories: _unavailableCategories?.build(),
              filteredCategories: _filteredCategories?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extraConfig';
        _extraConfig?.build();
        _$failedField = 'availableCategories';
        _availableCategories?.build();
        _$failedField = 'unavailableCategories';
        _unavailableCategories?.build();
        _$failedField = 'filteredCategories';
        _filteredCategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SeatingConfigChange', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
