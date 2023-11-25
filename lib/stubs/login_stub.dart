String stubLogin() => '''
import '/app/controllers/login_controller.dart';
import '/bootstrap/extensions.dart';
import '/bootstrap/helpers.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginPage extends NyStatefulWidget<LoginController> {
  static const path = '/login';

  LoginPage() : super(path, child: _LoginPageState());
}

class _LoginPageState extends NyState<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 15
                  )
                ]
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Column(children: <Widget>[
                NyTextField(
                  controller: widget.controller.textFieldEmail,
                  labelText: "EMAIL",
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  dummyData: "bechtelar.keshawn@example.net",
                  validationRules: "email",
                ),
                NyTextField(
                  controller: widget.controller.textFieldPassword,
                  labelText: "PASSWORD",
                  obscureText: true,
                  dummyData: "password",
                  validationRules: "regex:(?=.*d).{4,12}",
                  validationErrorMessage: "4 and 12 characters with one number",
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    color: ThemeColor.get(context).buttonBackground,
                    child: Text((isLocked('login') ? "Processing" : "Login")).bodyLarge(context).setColor(context, (color) => Colors.white),
                    onPressed: widget.controller.login,
                  ),
                ),
              ]),
            ),
            InkWell(onTap: widget.controller.showForgotPassword, child: Text("Forgot your password?"),)
          ],
        ),
      ),
    );
  }
}
''';
