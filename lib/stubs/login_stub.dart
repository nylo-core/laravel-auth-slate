String stubLogin() => '''
import '/resources/pages/forgot_password_page.dart';
import '/app/controllers/login_controller.dart';
import '/resources/widgets/logo_widget.dart';
import '/bootstrap/extensions.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginPage extends NyStatefulWidget<LoginController> {
  static const path = '/login';

  LoginPage() : super(path, child: () => _LoginPageState());
}

class _LoginPageState extends NyState<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        title: Logo(height: 40),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Login".tr()).headingSmall(context).fontWeightBold().paddingOnly(bottom: 25),
            NyForm.login(name: "login", crossAxisSpacing: 20),
            Container(
              height: 45,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.black87,
                  child: Text((isLocked('login') ? "Processing".tr() : "Login".tr()))
                      .bodyMedium(context)
                      .fontWeightBold()
                      .setColor(context, (color) => Colors.white),
                  onPressed: () {
                    NyForm.submit("login", onSuccess: (data) {
                      lockRelease('login', perform: () async {
                        await widget.controller.login(data['Email'], data['Password']);
                      });
                    });
                  }
              ),
            ),
            Text("Forgot your password?".tr(), textAlign: TextAlign.center)
                .onTap(() => routeTo(ForgotPasswordPage.path))
          ],
        ),
      ),
    );
  }
}
''';
