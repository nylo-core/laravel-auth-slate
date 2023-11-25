String stubForgotPassword() => '''
import 'package:flutter/material.dart';
import '/bootstrap/extensions.dart';
import '/bootstrap/helpers.dart';
import '/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/forgot_password_controller.dart';

class ForgotPasswordPage extends NyStatefulWidget<ForgotPasswordController> {
  static const path = '/forgot-password';

  ForgotPasswordPage() : super(path, child: _ForgotPasswordPageState());
}

class _ForgotPasswordPageState extends NyState<ForgotPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Container(
          height: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              Logo(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 15
                      )
                    ]
                ),
                child: Column(children: <Widget>[
                  NyTextField(
                    controller: widget.controller.textEmailForgotPassword,
                    labelText: "EMAIL",
                    enableSuggestions: false,
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    dummyData: "user@gmail.com",
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: ThemeColor.get(context).buttonBackground,
                      child: Text((isLocked('forgot_password') ? "Processing" : "Forgot Password")).bodyLarge(context).setColor(context, (color) => Colors.white),
                      onPressed: widget.controller.forgotPassword,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';
