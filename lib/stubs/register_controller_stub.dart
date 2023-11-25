String stubRegisterController() => '''
import '/app/events/laravel_auth_event.dart';
import '/app/models/laravel_auth_response.dart';
import '/app/networking/laravel_auth_api_service.dart';
import '/bootstrap/helpers.dart';
import 'controller.dart';
import 'package:flutter/widgets.dart';

class RegisterController extends Controller {

  final TextEditingController textFieldEmail = TextEditingController(),
      textFieldPassword = TextEditingController();

  construct(BuildContext context) {
    super.construct(context);

  }

  /// Register the user
  register() {
    String email = textFieldEmail.text,
        password = textFieldPassword.text;

    validate(rules: {
      "email": "email",
      "password": "(?=.*d).{4,12}"
    }, data: {
      "email": email,
      "password": password
    }, onSuccess: () async {
      LaravelAuthResponse? laravelAuthResponse = await api<LaravelAuthApiService>((request) => request.register(email, password), context: context);
      if (laravelAuthResponse?.status != 200) {
        showToastOops(description: laravelAuthResponse?.message ?? "");
        return;
      }
      await event<LaravelAuthEvent>(data: {"user": laravelAuthResponse});
    }, lockRelease: 'register');
  }
}
''';
