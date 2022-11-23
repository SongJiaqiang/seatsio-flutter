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
    final result = <Object?>[
      'own',
      serializers.serialize(object.own, specifiedType: const FullType(String)),
    ];
    Object? value;
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
              specifiedType: const FullType(String))! as String;
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
  final String own;
  @override
  final String? parent;
  @override
  final String? section;
  @override
  final String? displayedLabel;

  factory _$SeatsioLabel([void Function(SeatsioLabelBuilder)? updates]) =>
      (new SeatsioLabelBuilder()..update(updates))._build();

  _$SeatsioLabel._(
      {required this.own, this.parent, this.section, this.displayedLabel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(own, r'SeatsioLabel', 'own');
  }

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
    return $jf($jc(
        $jc($jc($jc(0, own.hashCode), parent.hashCode), section.hashCode),
        displayedLabel.hashCode));
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
            own: BuiltValueNullFieldError.checkNotNull(
                own, r'SeatsioLabel', 'own'),
            parent: parent,
            section: section,
            displayedLabel: displayedLabel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
