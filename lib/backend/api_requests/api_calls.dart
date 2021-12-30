import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class AirtableCall {
  static Future<ApiCallResponse> call({
    String issue = '',
    String room = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Airtable ',
      apiUrl: 'https://api.airtable.com/v0/app9bz66rDGXHbZng/Repairs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer keySJ3Ga07JDprE4a',
      },
      params: {
        'Issue': issue,
        'Room': room,
      },
      returnBody: true,
    );
  }
}
