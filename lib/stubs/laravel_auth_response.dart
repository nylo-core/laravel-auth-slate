String stubLaravelAuthResponseModel() => '''
import 'package:nylo_framework/nylo_framework.dart';

/// LaravelAuthResponse Model.

class LaravelAuthResponse extends Model {
  LaravelAuthResponse();

  String? token, status, message;

  LaravelAuthResponse.fromJson(data) {
    status = data['status'];
    message = data['message'];
    if (data['token'] != null) {
      token = data['token'];
    }
  }

  toJson() => {
    "status": status,
    "message": message,
    "token": token
  };
}
''';
