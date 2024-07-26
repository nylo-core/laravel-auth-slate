String stubRegister() => '''
import '/app/controllers/register_controller.dart';
import 'package:flutter/gestures.dart';
import '/app/forms/register_form.dart';
import 'package:url_launcher/url_launcher.dart';
import '/resources/widgets/logo_widget.dart';
import '/bootstrap/extensions.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RegisterPage extends NyStatefulWidget<RegisterController> {
  static const path = '/register';

  RegisterPage() : super(path, child: () => _RegisterPageState());
}

class _RegisterPageState extends NyState<RegisterPage> {

  RegisterForm form = RegisterForm();

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
            Text("Register".tr()).headingSmall(context).fontWeightBold().paddingOnly(bottom: 25),
            NyForm(form: form, crossAxisSpacing: 20),
            Container(
              height: 45,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.black87,
                  child: Text((isLocked('register') ? "Processing".tr() : "Register".tr()))
                      .bodyMedium(context)
                      .fontWeightBold()
                      .setColor(context, (color) => Colors.white),
                  onPressed: () {
                    form.submit(onSuccess: (data) {
                      lockRelease('register', perform: () async {
                        await widget.controller.register(
                            data['Name'], 
                            data['Email'], 
                            data['Password'],
                        );
                      });
                    });
                  }
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: 'By tapping "Register", you agree to our ',
                  ),
                  new TextSpan(
                    text: 'terms and conditions',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => launchUrl(termsUrl()),
                  ),
                  new TextSpan(text: '. You can also view our '),
                  new TextSpan(
                    text: 'privacy policy',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => launchUrl(privacyUrl()),
                  ),
                  new TextSpan(text: ' here.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Your privacy policy URL
  Uri privacyUrl() => Uri.parse("\${getEnv('APP_URL')}/privacy-policy");

  // Your terms and conditions URL
  Uri termsUrl() => Uri.parse("\${getEnv('APP_URL')}/terms-and-conditions");
}
''';
