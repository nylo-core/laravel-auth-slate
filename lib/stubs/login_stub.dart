String stubLogin() => '''
import '/bootstrap/extensions.dart';
import '/app/events/laravel_auth_event.dart';
import '/app/models/laravel_auth_response.dart';
import '/app/networking/laravel_auth_api_service.dart';
import '/bootstrap/helpers.dart';
import '/app/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/login';
  
  LoginPage({Key? key}) : super(key: key);
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {

  final TextEditingController _controllerEmailField = TextEditingController(),
      _controllerPasswordField = TextEditingController();

  @override
  init() async {
    super.init();
  }

  _loginUser() async {
    String email = _controllerEmailField.text,
        password = _controllerPasswordField.text;

    await lockRelease('login', perform: () async {

      await validate(rules: {
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
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  controller: _controllerEmailField,
                  labelText: "EMAIL",
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  dummyData: "user@gmail.com",
                  validationRules: "email",
                ),
                NyTextField(
                  controller: _controllerPasswordField,
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
                    onPressed: _loginUser,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
''';
