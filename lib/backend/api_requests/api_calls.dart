import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SendGridCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "lincolnmudau1@gmail.com"
        }
      ]
    }
  ],
  "from": {
    "email": "test@example.com"
  },
  "subject": "Sending with SendGrid is Fun",
  "content": [
    {
      "type": "text/plain",
      "value": "and easy to do anywhere, even with cURL"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
