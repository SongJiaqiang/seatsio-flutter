// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seatsio_label.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SeatsioLabel> _$seatsioLabelSerializer =
    new _$SeatsioLabelSerializer();

class _$SeatsioLabelSerializer implements StructuredSerializer<SeatsioLabel> {
  @override
  final Iterable<Type> types = const [SeatsioLabel, _$SeatsioLabel];
  @override
  final String wireName = 'SeatsioLabel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SeatsioLabel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.own;
    if (value != null) {
      result
        ..add('own')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parent;
    if (value != null) {
      result
        ..add('parent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.section;
    if (value != null) {
      result
        ..add('section')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayedLabel;
    if (value != null) {
      result
        ..add('displayedLabel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SeatsioLabel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SeatsioLabelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'own':
          result.own = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'section':
          result.section = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'displayedLabel':
          result.displayedLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SeatsioLabel extends SeatsioLabel {
  @override
  final String? own;
  @override
  final String? parent;
  @override
  final String? section;
  @override
  final String? displayedLabel;

  factory _$SeatsioLabel([void Function(SeatsioLabelBuilder)? updates]) =>
      (new SeatsioLabelBuilder()..update(updates))._build();

  _$SeatsioLabel._({this.own, this.parent, this.section, this.displayedLabel})
      : super._();

  @override
  SeatsioLabel rebuild(void Function(SeatsioLabelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeatsioLabelBuilder toBuilder() => new SeatsioLabelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeatsioLabel &&
        own == other.own &&
        parent == other.parent &&
        section == other.section &&
        displayedLabel == other.displayedLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, own.hashCode);
    _$hash = $jc(_$hash, parent.hashCode);
    _$hash = $jc(_$hash, section.hashCode);
    _$hash = $jc(_$hash, displayedLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeatsioLabel')
          ..add('own', own)
          ..add('parent', parent)
          ..add('section', section)
          ..add('displayedLabel', displayedLabel))
        .toString();
  }
}

class SeatsioLabelBuilder
    implements Builder<SeatsioLabel, SeatsioLabelBuilder> {
  _$SeatsioLabel? _$v;

  String? _own;
  String? get own => _$this._own;
  set own(String? own) => _$this._own = own;

  String? _parent;
  String? get parent => _$this._parent;
  set parent(String? parent) => _$this._parent = parent;

  String? _section;
  String? get section => _$this._section;
  set section(String? section) => _$this._section = section;

  String? _displayedLabel;
  String? get displayedLabel => _$this._displayedLabel;
  set displayedLabel(String? displayedLabel) =>
      _$this._displayedLabel = displayedLabel;

  SeatsioLabelBuilder();

  SeatsioLabelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _own = $v.own;
      _parent = $v.parent;
      _section = $v.section;
      _displayedLabel = $v.displayedLabel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeatsioLabel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeatsioLabel;
  }

  @override
  void update(void Function(SeatsioLabelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeatsioLabel build() => _build();

  _$SeatsioLabel _build() {
    final _$result = _$v ??
        new _$SeatsioLabel._(
            own: own,
            parent: parent,
            section: section,
            displayedLabel: displayedLabel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
