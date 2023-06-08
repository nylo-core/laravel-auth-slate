String stubLogin() => '''
import '/app/events/laravel_auth_event.dart';
import '/app/models/auth_response.dart';
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

    await validate(rules: {
      "email": "email",
      "password": "regex:^.{4,12}\$"
    }, data: {
      "email": email,
      "password": password
    }, onSuccess: () async {
      await lockRelease('login', perform: () async {
        LaravelAuthResponse? laravelAuthResponse = await api<LaravelAuthApiService>((request) => request.login(email, password), context: context);
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
        backgroundColor: "38b48b".toHexColor(),
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
                  dummyData: "admin@matesbet.com",
                  validationRules: "email",
                ),
                NyTextField(
                  controller: _controllerPasswordField,
                  labelText: "PASSWORD",
                  obscureText: true,
                  dummyData: "password",
                  validationRules: "regex:^.{4,12}\$",
                  validationErrorMessage: "Must be 4 and 12 digits long",
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: MaterialButton(
                    color: ThemeColor.get(context).buttonBackground,
                    child: Text((isLocked('login') ? "Processing" : "Login"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
