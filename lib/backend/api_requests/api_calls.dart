import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class AirtableCall {
  static Future<ApiCallResponse> call({
    String user = '',
    String issue = '',
    String room = '',
    String building = '',
    String status = '',
    String created = '',
    String updated = '',
  }) {
    final body = '''
{
  "fields": {
    "User": "${user}",
    "Issue": "${issue}",
    "Building": "${building}",
    "Room": "${room}",
    "Status": "${status}"
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
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SendGridCall {
  static Future<ApiCallResponse> call({
    String toEmail = '',
    String subject = '',
    String content = '',
    String name = '',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "<enter_to_email>"
        }
      ],
      "subject": "<enter_to_subject>"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "<enter_content>"
    }
  ],
  "from": {
    "email": "<enter_from_email>",
    "name": "<enter_from_name>"
  },
  "reply_to": {
    "email": "<enter_reply_to_email>",
    "name": "<enter_reply_to_name>"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {
        'toEmail': toEmail,
        'subject': subject,
        'content': content,
        'name': name,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
