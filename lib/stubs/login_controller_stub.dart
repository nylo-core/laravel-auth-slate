stubLoginController() => '''
import '/app/events/laravel_auth_event.dart';
import '/app/models/laravel_auth_response.dart';
import '/app/networking/laravel_auth_api_service.dart';
import '/bootstrap/helpers.dart';
import '/resources/pages/forgot_password_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'controller.dart';
import 'package:flutter/widgets.dart';

class LoginController extends Controller {

  final TextEditingController textFieldEmail = TextEditingController(),
      textFieldPassword = TextEditingController();

  construct(BuildContext context) {
    super.construct(context);

  }

  /// Show the forgot password page
  void showForgotPassword() {
    routeTo(ForgotPasswordPage.path);
  }

  /// Login the user
  void login() async {
    String email = textFieldEmail.text,
        password = textFieldPassword.text;

    validate(rules: {
      "email": "email",
      "password": "regex:(?=.*d).{4,12}"
    }, data: {
      "email": email,
      "password": password
    }, onSuccess: () async {
      LaravelAuthResponse? laravelAuthResponse = await api<LaravelAuthApiService>((request) => request.login(email, password), context: context);
      if (laravelAuthResponse?.status != 200) {
        showToastOops(description: laravelAuthResponse?.message ?? "");
        return;
      }
      event<LaravelAuthEvent>(data: {"user": laravelAuthResponse});
    }, lockRelease: 'login');
  }
}
''';
