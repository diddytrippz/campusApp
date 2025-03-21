// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountStruct extends FFFirebaseStruct {
  AccountStruct({
    String? accountHolder,
    String? accountNumber,
    String? accountType,
    String? branchCode,
    String? bankName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accountHolder = accountHolder,
        _accountNumber = accountNumber,
        _accountType = accountType,
        _branchCode = branchCode,
        _bankName = bankName,
        super(firestoreUtilData);

  // "account_holder" field.
  String? _accountHolder;
  String get accountHolder => _accountHolder ?? '';
  set accountHolder(String? val) => _accountHolder = val;

  bool hasAccountHolder() => _accountHolder != null;

  // "account_Number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;

  bool hasAccountNumber() => _accountNumber != null;

  // "account_Type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  set accountType(String? val) => _accountType = val;

  bool hasAccountType() => _accountType != null;

  // "branch_Code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;

  bool hasBankName() => _bankName != null;

  static AccountStruct fromMap(Map<String, dynamic> data) => AccountStruct(
        accountHolder: data['account_holder'] as String?,
        accountNumber: data['account_Number'] as String?,
        accountType: data['account_Type'] as String?,
        branchCode: data['branch_Code'] as String?,
        bankName: data['bank_name'] as String?,
      );

  static AccountStruct? maybeFromMap(dynamic data) =>
      data is Map ? AccountStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'account_holder': _accountHolder,
        'account_Number': _accountNumber,
        'account_Type': _accountType,
        'branch_Code': _branchCode,
        'bank_name': _bankName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'account_holder': serializeParam(
          _accountHolder,
          ParamType.String,
        ),
        'account_Number': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'account_Type': serializeParam(
          _accountType,
          ParamType.String,
        ),
        'branch_Code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'bank_name': serializeParam(
          _bankName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AccountStruct fromSerializableMap(Map<String, dynamic> data) =>
      AccountStruct(
        accountHolder: deserializeParam(
          data['account_holder'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['account_Number'],
          ParamType.String,
          false,
        ),
        accountType: deserializeParam(
          data['account_Type'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_Code'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
      );

  static AccountStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AccountStruct(
        accountHolder: convertAlgoliaParam(
          data['account_holder'],
          ParamType.String,
          false,
        ),
        accountNumber: convertAlgoliaParam(
          data['account_Number'],
          ParamType.String,
          false,
        ),
        accountType: convertAlgoliaParam(
          data['account_Type'],
          ParamType.String,
          false,
        ),
        branchCode: convertAlgoliaParam(
          data['branch_Code'],
          ParamType.String,
          false,
        ),
        bankName: convertAlgoliaParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AccountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccountStruct &&
        accountHolder == other.accountHolder &&
        accountNumber == other.accountNumber &&
        accountType == other.accountType &&
        branchCode == other.branchCode &&
        bankName == other.bankName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([accountHolder, accountNumber, accountType, branchCode, bankName]);
}

AccountStruct createAccountStruct({
  String? accountHolder,
  String? accountNumber,
  String? accountType,
  String? branchCode,
  String? bankName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AccountStruct(
      accountHolder: accountHolder,
      accountNumber: accountNumber,
      accountType: accountType,
      branchCode: branchCode,
      bankName: bankName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AccountStruct? updateAccountStruct(
  AccountStruct? account, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    account
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAccountStructData(
  Map<String, dynamic> firestoreData,
  AccountStruct? account,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (account == null) {
    return;
  }
  if (account.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && account.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final accountData = getAccountFirestoreData(account, forFieldValue);
  final nestedData = accountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = account.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAccountFirestoreData(
  AccountStruct? account, [
  bool forFieldValue = false,
]) {
  if (account == null) {
    return {};
  }
  final firestoreData = mapToFirestore(account.toMap());

  // Add any Firestore field values
  account.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAccountListFirestoreData(
  List<AccountStruct>? accounts,
) =>
    accounts?.map((e) => getAccountFirestoreData(e, true)).toList() ?? [];
