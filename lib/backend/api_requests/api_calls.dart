import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

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
      params: {
        'User': user,
        'Issue': issue,
        'Room': room,
        'Building': building,
        'Status': status,
        'Created': created,
        'Updated': updated,
        'Name': name,
        'Links': links,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
