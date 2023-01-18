// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactsStruct> _$contactsStructSerializer =
    new _$ContactsStructSerializer();

class _$ContactsStructSerializer
    implements StructuredSerializer<ContactsStruct> {
  @override
  final Iterable<Type> types = const [ContactsStruct, _$ContactsStruct];
  @override
  final String wireName = 'ContactsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContactsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.surname;
    if (value != null) {
      result
        ..add('surname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ContactsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactsStruct extends ContactsStruct {
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? contact;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ContactsStruct([void Function(ContactsStructBuilder)? updates]) =>
      (new ContactsStructBuilder()..update(updates))._build();

  _$ContactsStruct._(
      {this.name, this.surname, this.contact, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ContactsStruct', 'firestoreUtilData');
  }

  @override
  ContactsStruct rebuild(void Function(ContactsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsStructBuilder toBuilder() =>
      new ContactsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsStruct &&
        name == other.name &&
        surname == other.surname &&
        contact == other.contact &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), surname.hashCode), contact.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsStruct')
          ..add('name', name)
          ..add('surname', surname)
          ..add('contact', contact)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ContactsStructBuilder
    implements Builder<ContactsStruct, ContactsStructBuilder> {
  _$ContactsStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surname;
  String? get surname => _$this._surname;
  set surname(String? surname) => _$this._surname = surname;

  String? _contact;
  String? get contact => _$this._contact;
  set contact(String? contact) => _$this._contact = contact;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ContactsStructBuilder() {
    ContactsStruct._initializeBuilder(this);
  }

  ContactsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _surname = $v.surname;
      _contact = $v.contact;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsStruct;
  }

  @override
  void update(void Function(ContactsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsStruct build() => _build();

  _$ContactsStruct _build() {
    final _$result = _$v ??
        new _$ContactsStruct._(
            name: name,
            surname: surname,
            contact: contact,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ContactsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
