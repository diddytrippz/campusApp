import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start loadshedding Group Code

class LoadsheddingGroup {
  static String getBaseUrl() => 'https://developer.sepush.co.za/business/2.0/';
  static Map<String, String> headers = {
    'Token': '7A550360-45E24264-87145FB1-F7242A64',
  };
  static GetLoadsheddingCall getLoadsheddingCall = GetLoadsheddingCall();
  static GetAreaCall getAreaCall = GetAreaCall();
  static AllowCall allowCall = AllowCall();
}

class GetLoadsheddingCall {
  Future<ApiCallResponse> call({
    String? id = 'Fourways',
  }) async {
    final baseUrl = LoadsheddingGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getLoadshedding',
      apiUrl: '${baseUrl}/area',
      callType: ApiCallType.GET,
      headers: {
        'Token': '7A550360-45E24264-87145FB1-F7242A64',
      },
      params: {
        'id': id,
        'test': "current",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      ) as List?;
  dynamic endDate(dynamic response) => getJsonField(
        response,
        r'''$.events[:].end''',
      );
  dynamic currentNote(dynamic response) => getJsonField(
        response,
        r'''$.events[:].note''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.events[:].start''',
      );
  dynamic infoName(dynamic response) => getJsonField(
        response,
        r'''$.info''',
      );
  dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$.info.name''',
      );
  dynamic region(dynamic response) => getJsonField(
        response,
        r'''$.info.region''',
      );
  dynamic schedule(dynamic response) => getJsonField(
        response,
        r'''$.schedule''',
      );
  List? days(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days''',
        true,
      ) as List?;
  List? daysDate(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].date''',
        true,
      ) as List?;
  List? daysName(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].name''',
        true,
      ) as List?;
  List? daysStages(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].stages''',
        true,
      ) as List?;
  dynamic source(dynamic response) => getJsonField(
        response,
        r'''$.schedule.source''',
      );
}

class GetAreaCall {
  Future<ApiCallResponse> call({
    String? text = 'fourways',
    String? test = '',
  }) async {
    final baseUrl = LoadsheddingGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getArea',
      apiUrl: '${baseUrl}/areas_search',
      callType: ApiCallType.GET,
      headers: {
        'Token': '7A550360-45E24264-87145FB1-F7242A64',
      },
      params: {
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? idAreas(dynamic response) => getJsonField(
        response,
        r'''$.areas''',
        true,
      ) as List?;
  List? idName(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].id''',
        true,
      ) as List?;
  List? region(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].name''',
        true,
      ) as List?;
  List? areaRegion(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].region''',
        true,
      ) as List?;
}

class AllowCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = LoadsheddingGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'allow',
      apiUrl: '${baseUrl}/api_allowance',
      callType: ApiCallType.GET,
      headers: {
        'Token': '7A550360-45E24264-87145FB1-F7242A64',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End loadshedding Group Code

class AirtableCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    String? issue = '',
    String? room = '',
    String? building = '',
    String? status = '',
    String? created = '',
    String? updated = '',
    String? name = '',
    String? links = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fields": {
    "User": "${user}",
    "Issue": "${issue}",
    "Building": "${building}",
    "Room": "${room}",
    "Status": "${status}",
    "Name": "${name}",
    "Links": "${links}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Airtable',
      apiUrl: 'https://api.airtable.com/v0/app9bz66rDGXHbZng/Maintenance',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer keySJ3Ga07JDprE4a',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
