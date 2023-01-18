import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start loadshedding Group Code

class LoadsheddingGroup {
  static String baseUrl = 'https://developer.sepush.co.za/business/2.0/';
  static Map<String, String> headers = {
    'Token': 'EF39C229-A0A34AE7-8372F901-49D6483F',
  };
  static GetLoadsheddingCall getLoadsheddingCall = GetLoadsheddingCall();
  static GetAreaCall getAreaCall = GetAreaCall();
  static AllowCall allowCall = AllowCall();
}

class GetLoadsheddingCall {
  Future<ApiCallResponse> call({
    String? id = 'Fourways',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLoadshedding',
      apiUrl: '${LoadsheddingGroup.baseUrl}/area',
      callType: ApiCallType.GET,
      headers: {
        ...LoadsheddingGroup.headers,
      },
      params: {
        'id': id,
        'test': "current",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      );
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
  dynamic days(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days''',
        true,
      );
  dynamic daysDate(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].date''',
        true,
      );
  dynamic daysName(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].name''',
        true,
      );
  dynamic daysStages(dynamic response) => getJsonField(
        response,
        r'''$.schedule.days[:].stages''',
        true,
      );
  dynamic source(dynamic response) => getJsonField(
        response,
        r'''$.schedule.source''',
      );
}

class GetAreaCall {
  Future<ApiCallResponse> call({
    String? text = 'Fourways',
    String? test = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getArea',
      apiUrl: '${LoadsheddingGroup.baseUrl}/areas_search',
      callType: ApiCallType.GET,
      headers: {
        ...LoadsheddingGroup.headers,
      },
      params: {
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic idAreas(dynamic response) => getJsonField(
        response,
        r'''$.areas''',
        true,
      );
  dynamic idName(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].id''',
        true,
      );
  dynamic region(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].name''',
        true,
      );
  dynamic areaRegion(dynamic response) => getJsonField(
        response,
        r'''$.areas[:].region''',
        true,
      );
}

class AllowCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'allow',
      apiUrl: '${LoadsheddingGroup.baseUrl}/api_allowance',
      callType: ApiCallType.GET,
      headers: {
        ...LoadsheddingGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
