import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

Future<ApiCallResponse> airtableCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'Airtable ',
    apiUrl: 'https://api.airtable.com/v0/app9bz66rDGXHbZng/Repairs',
    callType: ApiCallType.GET,
    headers: {
      'Authorization': 'Bearer keySJ3Ga07JDprE4a',
    },
    params: {},
    returnBody: true,
  );
}
